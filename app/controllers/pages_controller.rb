class PagesController < ApplicationController
  def home
  end

  def blog

 article1 = 
	{ 
	"title" => "Mon 1er article",
	"content" => "blablablablabla"
} 

 article2 = 
	{ 
	"title" => "Mon 2ème article",
	"content" => "blablablablabla"
} 

article3 = 
	{ 
	"title" => "Mon 3ème article",
	"content" => "blablablablabla"
} 

@articles = [article1, article2, article3] 
  end 

  def team
  end
end
