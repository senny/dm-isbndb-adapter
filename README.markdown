# DataMapper ISBNdb Adapter

This is a DataMapper adapter to easily fetch data from ISBNdb. ISBNdb.com
project is a database of books providing on-line and remote research
tools for individuals, book stores, librarians, scientists,
etc. Taking data from hundreds of libraries across the world ISBNdb is
a unique tool you won't find anywhere else.

## Installation
Installing the adapter is as simple as running:
           $ sudo gem install senny-dm-isbndb-adapter

or clone the repository and install the gem from source
         $ git clone git://github.com/senny/dm-isbndb-adapter.git
         $ cd dm-isbndb-adapter
         $ rake install

## Setup
First you need to get a api-key for isbndb. You can sign up [here](https://isbndb.com/account/create.html). The next step is setting up DataMapper. You need to pass the adapter and the access_key variables. The access-key is your isbndb api-key.

    DataMapper.setup(:default, {
      :adapter => 'isbndb',
      :access_key => 'your_secret_isbndb_api_key'
    })

After setting up DataMapper you can create Models to access the data
from isbndb. The following section gives you some examples how to
create your models.

1. You can use the bundled mixins, which contain a basic setup
      
        class Book
          include DataMapper::Resource
          include DataMapper::Resource::Isbndb::BookModel
        end

2. You can create the whole model yourself. You can lookup the
properties for the models at the isbndb api reference

        class Book
          include DataMapper::Resource

           property :id, String, :key => true, :field => 'book_id'
           property :title, String
           property :title_long, String
           property :isbn, String
           property :author, String, :field => 'authors_text'
         end

