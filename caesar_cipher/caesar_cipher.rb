def caesar_cipher(string, shift)
  string.split("").map {|char| shift_character(char, shift)}.join("")
end

def shift_character(character, shift)
  # shift should be positive for this method
  # if a negative number is given, convert to positive number
  while shift < 0
    shift += 26
  end

  lower_range = ("a".."z").to_a
  upper_range = ("A".."Z").to_a

  #select range for character
  if lower_range.index(character) != nil
    new_character_ord = character.ord+shift
    reduce_character(new_character_ord, "z".ord).chr
  elsif upper_range.index(character) != nil
    new_character_ord = character.ord+shift
    reduce_character(new_character_ord, "Z".ord).chr
  else
    character
  end
end

# adjust characters that were shifted out of their ranges
def reduce_character(character_ord, max_ord)
  while character_ord > max_ord
    character_ord -= 26
  end
  character_ord
end


puts caesar_cipher("What a string!", 5)
puts caesar_cipher("A new and different string.", -12)
puts caesar_cipher("The third and final string (with numbers like 15 and -40)", 45)
