class RecipesController < ApplicationController
  # GET /recipes/new
  # 新規投稿ページを表示するためのアクション
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  # フォームから送られたデータを受け取り、保存するためのアクション
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to root_path, notice: "レシピが投稿されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /recipes/:id/edit
  # 編集ページを表示するためのアクション
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # PATCH/PUT /recipes/:id
  # フォームから送られたデータで、データベースを更新するためのアクション
  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to root_path, notice: "レシピが更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # URLの:idを使って、データベースから削除したいレシピを1件見つけてくる
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path, notice: "レシピが削除されました。", status: :see_other
  end

  def show
    # URLの:idを使って、データベースから表示したいレシピを1件見つけてくる
    @recipe = Recipe.find(params[:id])
  end
  
  private
    # Strong Parameters: 不正なデータを受け付けないように、許可するパラメータを定義
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :instructions)
    end
end