#!/usr/bin/env ruby

class PhotoOrg
  def initialize
    @photos = []
    @cities = {}
  end

  def solution(s)
    s.lines.each do |photo|
      filename, city, date = photo.split(", ")
      @cities[city] ||= []
      @cities[city] << date
      @photos << {city: city, date: date, ext: extension(filename)}
    end

    # sort photos of the same city by date
    @cities.values.map(&:sort!)

    @photos.map { |p| "#{numbered_city(p[:city], p[:date])}.#{p[:ext]}" }
  end

  private

  def numbered_city(city, date)
    num = @cities[city].index(date) + 1
    num_dates = @cities[city].count
    city + num.to_s.rjust(num_dates.digits.count, "0")
  end

  def extension(filename)
    filename.match(/jpg|png|jpeg/)
  end
end

if $PROGRAM_NAME == __FILE__
  p = PhotoOrg.new

  puts p.solution(IO.read("input.txt"))
end
