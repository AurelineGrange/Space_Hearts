module ApplicationHelper
# Returns the full title on a per-page basis.
def full_title(page_title)
	base_title = "Love Space Mission"
	if page_title.empty?
		base_title
	else
		"#{base_title} :: #{page_title}"
	end
end

def random_key
	adjectives = ['Fresh', 'Happy', 'Devoted' , 'Loving' , 'Sympathetic' , 'Believing' , 'Supportive' , 'Enlightened' , 'Clever' , 'Involved' ,
			'Intent', 'Joyful',  'Liking', 'Sweet', 'Pride', 'Faith' ,'Thrilled', 'Serene', 'Cute']
	nouns = ['Crocodile', 'Angel', 'Sweetheart ', 'Cupcake' , 'Sparkle' , 'Honey' , 'Sugar' , 'Love' , 'Sweetie', 'Cutie','Baby']
	key= adjectives[Random.rand(19)].to_s<<"-"<<nouns[Random.rand(11)].to_s<<"-"<<(1_000 + Random.rand(9_999 - 1_000)).to_s 
	while(Micropost.find_by(secret_key: key))
	key= adjectives[Random.rand(19)].to_s<<"-"<<nouns[Random.rand(11)].to_s<<"-"<<(1_000 + Random.rand(9_999 - 1_000)).to_s 
	end
	return key
end

end
