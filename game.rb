# frozen_string_literal: true

require 'time'


class Question
  def initialize(text, correct_answer, incorrect_answers)
    @text = text
    @correct_answer = correct_answer
    @answers = incorrect_answers
    @answers.append(correct_answer)
  end

  def correct?(answer)
    if answer == @correct_answer
      true
    elsif @answers.include?(answer)
      false
    else
      raise "The answer #{answer} does not exist!"
    end
  end

  def shuffle
    @answers.shuffle!
  end

  def to_s
    "#{@text}\n1)#{@answers[0]}\n2)#{@answers[1]}\n3)#{@answers[2]}\n4)#{@answers[3]}"
  end

  attr_reader :answers
end

class Player
  def initialize(name)
    @name = name
    @balance = 0
  end
  
  def increase_balance(value=200_000)
    @balance += value
  end

  attr_reader :balance
end

QUESTIONS = [
  Question.new(
    'На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?',
    'На гуслях',
    [
      'На виоланчели',
      'На баяне',
      'На гитаре'
    ]),
  Question.new(
    'В какой из этих стран один из официальных языков - французский?',
    'Республика Гаити',
    %w[Кения Эквадор Венесуэла]
  ),
  Question.new(
    'В каком году произошла Куликовская битва?',
    '1380',
    %w[1569 1616 1773]
  ),
  Question.new(
    'Какая картина Малевича находится в Русском музее?',
    'Красный квадрат',
    [
      'Белый квадрат',
      'Чёрный квадрат',
      'Точильщик'
    ]
  ),
  Question.new(
    'Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?',
    'Бездна Челленджера',
    [
      'Кермадек',
      'Филиппинская плита',
      'Черное Логово'
    ]
  )
].freeze

def questions_gen
  questions = QUESTIONS.shuffle
  questions.each do |question|
    question.shuffle
    question
  end
end

puts 'Введите ваше имя: '
name = gets.chomp
player = Player.new(name)
questions_gen.each do |question|
  puts question
  answer_num = gets.chomp.to_i
  answer = question.answers[answer_num - 1]
  if question.correct?(answer)
    player.increase_balance
    puts "Верно!\n\n"
  else
    puts "Нерпавильный ответ!\n\n"
  end
end

puts "Ваш выигрыш #{player.balance} рублей"
