def get_first_name_of_season_winner(data, given_season)
  name=""
  data.each{|season, season_hash|
    season_hash.each{ |cont_hash|
      name=cont_hash["name"] if cont_hash["status"]=="Winner"
    } if season==given_season
  }
  name.split(" ")[0]
end

def get_contestant_name(data, occupation)
  name=""
  data.each{|season, season_hash|
    season_hash.each{ |cont_hash|
      name=cont_hash["name"] if cont_hash["occupation"]==occupation
    }
  }
  name
end

def count_contestants_by_hometown(data, hometown)
  counter=0
  data.each{|season, season_hash|
    season_hash.each{ |cont_hash|
      counter+=1 if cont_hash["hometown"]==hometown
    }
  }
  counter
end

def get_occupation(data, hometown)
  data.each{|season, season_hash|
    season_hash.each{ |cont_hash|
     return cont_hash["occupation"] if cont_hash["hometown"]==hometown
    }
  }
end

def get_average_age_for_season(data, given_season)
  age=0
  count=0
  data.each{|season, season_hash|
    season_hash.each{ |cont_hash|
      age+=cont_hash["age"].to_f
      count +=1
    } if season==given_season
  }
  (age/count).round(0)
end
