#!/usr/bin/env ruby

require 'pry-byebug'

class PhotoOrg
  def initialize
    @input = IO.read("input.txt")
    @photos = []
    @cities = {}
    @newfilenames = []
  end

  def run
    solution(@input)
  end

  private

  def solution(s)
    s.split("\n").each do |photo|
      filename, city, date = photo.split(", ")
      @cities[city] = @cities[city] ?  @cities[city] : []
      @cities[city].push(date)
      @photos.push(city: city, date: date, extension: filename.match(/jpg|png|jpeg/))
    end

    @cities.values.each do |array|
      array.sort!
    end

    @photos.each do |photo|
      city = photo[:city]
      count = @cities[city].index(photo[:date]) + 1
      largest = @cities[city].count
      photo[:city] = city + count.to_s.rjust(largest.digits.count, "0")
      @newfilenames.push("#{photo[:city]}.#{photo[:extension]}")
    end

    @newfilenames
  end
end

if $PROGRAM_NAME == __FILE__
  p = PhotoOrg.new

  puts p.run
end
