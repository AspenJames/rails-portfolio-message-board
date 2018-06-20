# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship -- both :user and :board has_many :messages
- [x] Include at least one belongs_to relationship -- :message belongs_to :user and :board
- [x] Include at least one has_many through relationship :user has_many :boards, :through => :messages, vice versa
- [x] The "through" part of the has_many through includes at least one user submittable attribute -- message.content is submitted by the user
- [x] Include reasonable validations for simple model objects -- User, Board, and Message objects all have validations
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
