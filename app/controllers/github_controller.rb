

# get '/github/new' do
#  # show the new view to enter a git username
# end

post '/github' do
  # consume data from new form and use github API
   @repos = GitHubApiAdapter.get_github_user_info(params[:user][:user_name])
   p JSON.parse(@repos.read_body)

   erb :"/github/show.html"
end
