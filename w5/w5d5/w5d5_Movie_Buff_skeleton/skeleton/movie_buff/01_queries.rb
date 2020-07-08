def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3
  # Movie.select(:id, :title, :score).where(score: 2..3)
  Movie
    .select(:id, :title, :score) 
    .where(score: 2..3)
    # .where('score between 2 and 3')
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where(actors: {name: 'Harrison Ford'})
    .where.not(castings: {ord: 1})
  


  # Movie
  #   .select(:id, :title)  #("movies.id, movies.title"}) 
  #   .joins(:actors)                          #actors is an association name here 
  #   .where(actors: {name: 'Harrison Ford'})  #actors is a key
  #   .where.not(castings: {ord: 1})

end

def biggest_cast

  Movie
    .select(:id, :title)
    .joins(:actors)
    .group('movies.id')
    .order('COUNT(*) DESC')
    .limit(3)

  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)


  # Movie
  #   .select(:id, :title)
  #   .joins(:actors)
  #   .group('movies.id') 
  #   .order('count(*) DESC') #movie.order(title: :DESC) just for one way.
  #   .limit(3) 


    # .having(count(*))
    # .order DESC 
    # .limit 3 )
    # .count("actor_id as num_actors")
    # .order (DESC)
    # .limit(3)


    # Chirp
        # .select(:id, :body, "count(*) AS num_likes")
        # .joins(:likes)
        # .group(:id)


end

def directed_by_one_of(them)
    Movie
      .select(:id, :title)
      .joins(:director)
      .where(actors: {name: them})
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.

  # Movie
  #   .select(:id, :title)
  #   .joins(:director)
  #   .where(actors: {name: them})
end

def movie_names_before_1940
    Movie
      .where('yr < 1940')
      .pluck(:title)
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.movies: {


  # Movie.where('yr < 1940').pluck(:title)

end
