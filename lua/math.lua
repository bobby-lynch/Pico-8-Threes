
-- driver for converttobinary() function
function tobinary(decimal)

    -- decimal number to be converted
    local d = decimal

    return converttobinary(d, 0b0, -0b1)

end

-- converts a base 10 number to a binary number
function converttobinary(decimal, binary, power)

    -- decimal number to be converted
    local d = decimal
    -- binary remiander from division by 2
    local b = binary
    -- binary power
    local p = power

    -- base case
    if (d <= 0) then

        return (b * (0b10 ^ p))

    else

        -- recursively add the remainder of the decimal number divided by 2
        return ((b * (0b10 ^ p)) + converttobinary(flr(d / 2), (d % 0b10), (p + 0b1)))

    end

end
