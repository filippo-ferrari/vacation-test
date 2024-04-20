function is_weekend(day, month, year)
  local weekday = os.date("*t", os.time { year = year, month = month, day = day }).wday
  return weekday == 1 or weekday == 7
end

function is_holiday(day, month, year)
  local holidays = {
    { day = 1,  month = 1 },  -- Capodanno
    { day = 6,  month = 1 },  -- Epifania
    { day = 31, month = 3 },  -- Pasqua
    { day = 1,  month = 4 },  -- Pasquetta
    { day = 25, month = 4 },  -- Festa della liberazione
    { day = 1,  month = 5 },  -- Festa dei lavoratori
    { day = 2,  month = 6 },  -- Festa della Repubblica
    { day = 17, month = 6 },  -- San Ranieri
    { day = 15, month = 8 },  -- Ferragosto
    { day = 1,  month = 11 }, -- Giorno dei santi
    { day = 8,  month = 12 }, -- Immacolata
    { day = 25, month = 12 }, -- Natale
    { day = 26, month = 12 }, -- Santo Stefano
    { day = 31, month = 12 }  -- San Silvestro
  }
  for _, holiday in ipairs(holidays) do
    if day == holiday.day and month == holiday.month then
      return true
    end
  end
  return false
end

function generate_year_array(year)
  local year_array = {}
  for month = 1, 12 do
    local days_in_month = os.date("%d", os.time { year = year, month = month + 1, day = 0 })
    for day = 1, days_in_month do
      if is_weekend(day, month, year) or is_holiday(day, month, year) then
        year_array[#year_array + 1] = 1
      else
        year_array[#year_array + 1] = 0
      end
    end
  end
  return year_array
end

-- Example: Generate the array for the year 2024
local year = 2024
local year_array = generate_year_array(year)

-- Print the array
for i, value in ipairs(year_array) do
  io.write(value)
  if i % 7 == 0 then
    io.write("\n")
  else
    io.write(" ")
  end
end

