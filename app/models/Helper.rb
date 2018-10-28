class Helper

  def self.slug(input)
    return input.downcase.split(" ").join("-")
  end

  def self.find_by_slug(input)
    # binding.pry
    # return input.split("-").join(" ").titleize
    y = ["with", "the", "for", "is", "of", "a"]
    reverse_slug = []
    splitting_array = input.split("-")
    splitting_array.each do |x|
      if !y.include? x
        reverse_slug << x.titleize
      elsif splitting_array[0] == x
        reverse_slug << x.titleize
      else
        reverse_slug << x
      end
    end
    reverse_slug.join(" ")
  end
end
