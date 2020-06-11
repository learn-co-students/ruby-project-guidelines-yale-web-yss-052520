require_relative '../config/environment'

# API_KEY = "AIzaSyBEzjOmk1zJTIeEf3-HxPPpKoeIUmXVyRI"

# url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:search]}&maxResults=15&key=#{ENV["AIzaSyBEzjOmk1zJTIeEf3-HxPPpKoeIUmXVyRI"]}"

def search(keyword)
    url = "https://www.googleapis.com/books/v1/volumes?q=#{keyword}&maxResults=1"
    response = HTTParty.get(url)
    return result = response.parsed_response
end

def search_title(keyword)
    search(keyword)["items"][0]["volumeInfo"]["title"]
end

def search_author(keyword)
    search(keyword)["items"][0]["volumeInfo"]["authors"][0]
end

def search_publisher(keyword)
    search(keyword)["items"][0]["volumeInfo"]["publisher"]
end

def search_date(keyword)
    search(keyword)["items"][0]["volumeInfo"]["publishedDate"]
end

def search_pages(keyword)
    search(keyword)["items"][0]["volumeInfo"]["pageCount"]
end

def search_genre(keyword)
    search(keyword)["items"][0]["volumeInfo"]["categories"][0]
end


# puts author = result["items"][0]["volumeInfo"]["authors"][0]
# puts publisher = result["items"][0]["volumeInfo"]["publisher"]
# puts date = result["items"][0]["volumeInfo"]["publishedDate"]
# puts page_count = result["items"][0]["volumeInfo"]["pageCount"]
# puts category = result["items"][0]["volumeInfo"]["categories"][0]

# puts hello
# search = search("cat in the hat")
# title = get_title(search)
# title.class
# array = []
# array << title
# myarray = title.split
# puts myarray[0]

# puts search_title("Cat in the Hat")