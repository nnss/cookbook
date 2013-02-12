class RecipesController < ApplicationController

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    if current_user.nil? || current_user.name.nil?
      redirect_back_or  log_in_path
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    #@categories = @recipe.categories
  end

  
  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id || 1
    #@categories = @recipe.categories
    ##__##@recipe.categories = 

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    params[:categories] ||= {}
    @recipe = Recipe.find(params[:id])
    ##-no user @category = @post.categories.build(params[:category]) unless params[:category][:name].blank?
    #@category = @recipe.categories.build(params[:category_list]) unless params[:category_list][:name].blank?
    #@categories = @recipes.categories
    @categories = Category.find(category_list.keys) rescue []

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
end
