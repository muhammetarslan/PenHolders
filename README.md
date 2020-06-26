# PenHolders

[penholders](https://penholders.herokuapp.com/)


PenHolders is a collaborative platform for storytelling. After signing up, you can start creating a story or search for authors to help them write their stories.

![alt text](https://i.imgur.com/wiXLZ4Y.png)

![alt text](https://i.imgur.com/FZpYkpy.png)


## Project Structure
```
src
	-main
		.java.com.fatih.demo
				model(POJO models [Content, PullRequests, Role, User] )
				repository(JpaRepositories)
				Service(logic implementation)
				validator(Implementing Validator class for user creation)
				web(api directing)
		.resources
				application and validation properties.
		.webapp
				jsp pages with bootstrap 4
       
