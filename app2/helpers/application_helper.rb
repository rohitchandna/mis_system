module ApplicationHelper


def get_username(u)
	u.to_s.gsub('@greenbackforex.com','')
  end



def my_time_format(t)
    t.strftime("%Y-%m-%d %H:%M:%S")
  end



end
