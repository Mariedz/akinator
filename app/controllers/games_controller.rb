class GamesController < ApplicationController

QUESTIONS = [
   "Est-ce qu'il a les yeux bleus ?",
   "Est-ce que c'est un homme ?",
   "Est-ce qu'il est vegan ?",
   "Est-ce qu'il vient d'Aquitaine ?"
  ]

student1 = {
    "name" => "Marie",
    "answers" => ["yes", "no", "no", "no"]
  }
  student2 = {
    "name" => "Roxane",
    "answers" => ["yes", "no", "no", "yes"]
  }
  STUDENTS = [ student1, student2 ]

  def show
    @game_id = params["id"]
    @game = Game.find(@game_id)
    @answers = @game["answers"]
    @students = STUDENTS
  end


  def create
    @game = Game.create
  	redirect_to edit_game_path(id: @game["id"], question_id: 0), method: :get
  end

  def edit
    @game_id = params["id"]
    @question_id = params["question_id"].to_i
    @question = QUESTIONS[@question_id]
  end

  def update
    @game_id = params["id"]
    @game = Game.find(@game_id)
    @game["answers"] << params["answer"]
    @game.save
  	@question_id = params["question_id"].to_i
    if @question_id < QUESTIONS.size
      redirect_to edit_game_path(id: @game_id, question_id: @question_id), method: :get
    else
      redirect_to game_path(id: @game_id), method: :get
    end
  end
  end

