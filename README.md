cookbook
========

RoR recipe cook book

just playing with RoR to import recipies from MealMaster


schema:
user name,mail,password
group (user_id,group) TBI
recipe (user_id,title,yield,instructions)
ingredients (unit,amount,name,recipe_id)

todo:
implement groups (levels of view/edit/approve recipes,users)
implement recipe approval (probably with workflow)
delete comments
spam protector (captcha for forms for not loged in users)
implement voting (acts as ...)
