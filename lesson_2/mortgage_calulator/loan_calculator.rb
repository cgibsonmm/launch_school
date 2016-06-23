require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  puts "=> #{MESSAGES[message]}"
end

# Check to see if input is a valid number
def number?(input)
  /\d/.match(input) && /\A\d*\.?\d*\z/.match(input)
end

# changes number fromat depenig on fixnum or float
def change_format(number)
  if number =~ /\A\d*\.{1}\d*\z/
    number.to_f
  else
    number.to_i
  end
end

prompt('greeting')

# Prompt for name and make sure name is valid
name = 'corey'
loop do
  prompt('ask_name')
  name = gets.chomp
  if name.empty?
    prompt('not_vaild')
  else
    break
  end
end

loop do
  # Defines vars
  correct_params = 'n'
  loan_ammount = ''
  apr = ''
  mpr = ''
  loan_duration = ''

  # GETs loan ammount
  while correct_params != 'y'
    loop do
      prompt('loan_ammount')
      loan_ammount = gets.chomp
      if number?(loan_ammount)
        loan_ammount = change_format(loan_ammount)
        break
      else
        prompt('not_vaild')
      end
    end

    # GETs apr and convert to mpr
    loop do
      prompt('apr')
      apr = gets.chomp
      if number?(apr)
        apr = format('%.2f', apr).to_f
        mpr = apr / 12 / 100
        break
      else
        prompt('not_vaild')
      end
    end

    # GETs initial loan duration
    loop do
      prompt('loan_duration')
      loan_duration = gets.chomp
      if number?(loan_duration)
        loan_duration = change_format(loan_duration)
        break
      else
        prompt('not_vaild')
      end
    end

    # asks if all parameters are correct to compute
    correct_params_prompt = <<-MSG
    _______________________________________________
    Are these parameters correct?
    Your loan amount is: $#{loan_ammount}
    Your APR is: #{apr}%
    Your loan duration is: #{loan_duration} months?
    _______________________________________________
    --If these are correct type 'Y'--
    MSG

    puts correct_params_prompt
    correct_params = gets.chomp
    correct_params = correct_params.downcase
  end

  # computs payments and converts to $00.00 format
  monthly_payments = loan_ammount * (mpr * (1 + mpr)**loan_duration) / \
                     ((1 + mpr)**loan_duration - 1)

  monthly_payments = format("%.2f", monthly_payments)

  prompt('work')
  sleep(2)
  prompt('work_done')
  sleep(1)
  puts "=> Your monthly payments come out to: $#{monthly_payments}"
  sleep(2)

  prompt('run_again')
  final_answer = gets.chomp
  break if final_answer.downcase.start_with?('n')
end
