class RecipesController < ApplicationController
  skip_before_filter :require_user, only: [:show, :index, :tagindex]


  # GET /recipes
  # GET /recipes.json
  def index
    Recipe.where(:public => true).paginate(:page => params[:page]).order('id DESC')

    if params[:tag]
      @recipes = Recipe.tagged_with(params[:tag]).page(params[:page]).order('created_at DESC')
    else
      @recipes = Recipe.page(params[:page]).order('created_at DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def tagindex
    Recipe.where(:public => true).paginate(:page => params[:page]).order('id DESC')
    if params[:tag]
      @recipes = Recipe.tagged_with(params[:tag]).page(params[:page]).order('created_at DESC')
    else
      @recipes = Recipe.page(params[:page]).order('created_at DESC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    Rails.logger.debug("recipe looking for random/rand #{Recipe.public_methods.sort}")
    begin
      @recipe = Recipe.find(params[:id])
      @comments = @recipe.comment_threads.order('created_at desc')
      unless current_user.nil?
        @comment = Comment.build_from(@recipe, current_user.id, "")
      end

    rescue ActiveRecord::RecordNotFound => e
      @recipe = nil
    end

    if @recipe.nil?
      redirect_back_or_default root_path,:notice => "Recipe not fould"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @recipe }
      end
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
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
  end

  
  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id || 1
    Rails.logger.debug("### ingredient: #{Recipe.public_methods.sort}")
    #@recipe.ingredient.build

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
    @recipe = Recipe.find(params[:id])
    #@recipe.ingredient.build

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
