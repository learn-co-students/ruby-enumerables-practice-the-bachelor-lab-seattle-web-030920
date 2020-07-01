def get_first_name_of_season_winner(data, season)
  contestant = data[season].select {|contestant|
  contestant["status"] == "Winner"}
  contestant[0]["name"].split(' ')[0]
end

def get_contestant_name(data, occupation)
  name = ''
  data.each {|season, contestants| 
      contestants.each {|contestant| 
        name = contestant["name"] if contestant["occupation"] == occupation}
  }
  name
end

def count_contestants_by_hometown(data, hometown)
      count = 0
  data.each {|season, contestants| 
      contestants.each {|contestant| 
        count += 1 if contestant["hometown"] == hometown}
  }
  count
end

def get_occupation(data, hometown)
    occupation = ''
  data.each {|season, contestants| 
      array = contestants.select {|contestant| 
       contestant["hometown"] == hometown}
       if !array.empty?
         occupation = array[0]["occupation"] 
       end
  }
  occupation
end

def get_average_age_for_season(data, season)
    ages = []
  data[season].each {|contestant| 
        ages << contestant["age"].to_f}
  sum = ages.sum
  average = sum / ages.length
  average.round()
end
