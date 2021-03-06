# Show all questions on the home page
get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

# Fetch the form for posting a new question
get '/questions/new' do
  @user = current_user
  erb :'questions/new'
end

# Post the form with question params
post '/questions' do
  @user = current_user
  @question = Question.new(params[:question])
  @question.user_id = @user.id
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @corr_answers = @question.answers
  @corr_votes = @question.votes
  # corr_votes = Vote.where(voteable_type: "Question", voteable_id: params[:id])
  erb :'questions/show'
end

get '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  erb :'comments/_show'
end
