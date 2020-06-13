require_relative '../config/environment'

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

