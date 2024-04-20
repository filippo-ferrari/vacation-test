function is_weekend(day, month, year)
  local weekday = os.date("*t", os.time { year = year, month = month, day = day }).wday
  return weekday == 1 or weekday == 7
end

function generate_year_array(year)
  local year_array = {}
  for month = 1, 12 do
    local days_in_month = os.date("%d", os.time { year = year, month = month + 1, day = 0 })
    for day = 1, days_in_month do
      if is_weekend(day, month, year) then
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
