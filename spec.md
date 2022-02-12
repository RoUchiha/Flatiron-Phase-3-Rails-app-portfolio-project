# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    - multiple has_many relationships used
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    -   multiple belongs_to relationships used
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    -   2 has_many :through relationships used (comments and ratings through shows)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    -   users has_many shows and has_many comments/ratings through shows
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - ratings and comments are user submittable
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - used at least 1 validation for each model
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    -   User.favorite_shows fulfills this 
- [x] Include signup (how e.g. Devise)
    -   Signup on home page
- [x] Include login (how e.g. Devise)
    - login link from homepage
- [x] Include logout (how e.g. Devise)
    -   logout present link on all pages
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    -   signup/login via github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - users/:id/shows nested resources & comments/ratings nested resources in shows
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    -   new nested resource for ratings and comments
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    -   validation errors visible above form after render 

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate