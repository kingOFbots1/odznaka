# Skrypt na odznake policyjną która zapisuję się w bazie danych :D



-- Jak tego uzyć ?

#### 1. Wrzuc do DB
#### 2. Wystartuj
#### 3. /nadajodznake id numer
#### 4. Uzyj to w jakimś skrypcie np. na odznake 

function wezNumer(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM numery WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]
        return {
            steam = identity['identifier'],
            numer = identity['number']
        }
    else
        return nil
    end
end

##### Znane bugi:

###### 2 osoby mogą mieć ten sam numer odznaki

