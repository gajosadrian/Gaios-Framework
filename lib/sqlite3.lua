local sqlite3 = require('lsqlite3')

SQLite3 = {}
SQLite3.__index = SQLite3

local function trim(str)
    return (str:gsub("^%s*(.-)%s*$", "%1"))
end

function SQLite3.new(path)
    local self = {}
    setmetatable(self, SQLite3)

    self.connection = sqlite3.open(path)
    self._where = ''
    self._order = ''

    return self
end

function SQLite3:insert(table_name, table_data)
    local columns, values = {}, {}

    for column, value in pairs(table_data) do
        table.insert(columns, column)
        table.insert(values, '"' .. value .. '"')
    end

    self.connection:exec(trim('INSERT INTO ' .. table_name .. ' (' .. table.concat(columns, ',') .. ') VALUES(' .. table.concat(values, ',') .. ')'))
    self:reset()
end

function SQLite3:update(table_name, table_data)
    local tab = {}
    table_data['id'] = nil

    for column, value in pairs(table_data) do
        table.insert(tab, column .. '="' .. value .. '"')
    end
    local sql = table.concat(tab, ',')

    self.connection:exec(trim('UPDATE ' .. table_name .. ' SET ' .. sql .. ' ' .. self._where))
    self:reset()
end

function SQLite3:delete(table_name, num_rows)
    local limit = self:limit(num_rows)

    self.connection:exec(trim('DELETE FROM ' .. table_name .. ' '  .. self._where .. ' ' .. limit))
    self:reset()
end

function SQLite3:get(table_name, num_rows, columns)
    local limit = self:limit(num_rows)
    local columns = columns and table.concat(columns, ',') or '*'
    local query = trim('SELECT ' .. columns .. ' FROM ' .. table_name .. ' ' .. self._where .. ' ' .. self._order .. ' ' .. limit)

    self:reset()
    local tab = {}

    for row in self.connection:nrows(query) do
        table.insert(tab, row)
    end

    return tab
end

function SQLite3:first(table_name, columns)
    local result = self:get(table_name, 1, columns)
    return result[1]
end

function SQLite3:delete(table_name, num_rows)
    local limit = self:limit(num_rows)

    self.db:exec(trim('DELETE FROM ' .. table_name .. ' '  .. self._where .. ' ' .. limit))
    self:reset()
end

function SQLite3:where(property, value, operator, condition)
    operator = operator or '='
    condition = condition or 'AND'
    local sql = property .. operator .. '"' .. value .. '"'

    if self._where == '' then
        self._where = 'WHERE ' .. sql
    else
        self._where = self._where .. ' ' .. condition .. ' ' .. sql
    end

    return self
end

function SQLite3:limit(num_rows)
    return num_rows and ('LIMIT ' .. num_rows) or ''
end

function SQLite3:orderBy(column, direction)
    direction = direction and direction:upper() or 'DESC'
    local sql = column .. ' ' .. direction

    if self._order == '' then
        self._order = 'ORDER BY ' .. sql
    else
        self._order = self._order .. ',' .. ' ' .. sql
    end

    return self
end

function SQLite3:reset()
    self._where = ''
    self._order = ''
end

function SQLite3:getColumns(table_name)
    local columns = {}

    for row in self.connection:nrows('PRAGMA table_info(' .. table_name .. ')') do
        table.insert(columns, row.name)
    end

    return columns
end

function SQLite3:getTables()
    local tables = {}

    for row in self.connection:nrows('SELECT name FROM sqlite_master WHERE type="table"') do
        if row.name:sub(1, 6) ~= 'sqlite' then
            table.insert(tables, row.name)
        end
    end

    return tables
end
