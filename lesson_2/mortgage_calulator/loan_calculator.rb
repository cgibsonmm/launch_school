require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(message)
  puts "=> #{MESSAGES[message]}"
end

# Check to see if input is a valid number
def number?(input)
  /\d/.match(input) && /\A\d*\.?\d*\z/.match(input)
end

# changes number fromat depending on fixnum or float
def change_format(number)
  if number =~ /\A\d*\.{1}\d*\z/
    number.to_f
  else
    number.to_i
  end
end

prompt('greeting')

# Prompt for name and make sure name is valid
name = ''
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
  loan_ammount = ''
  apr = ''
  mpr = ''
  loan_duration = ''
  loan_duration_months = ''

  # GETs loan ammount
  loop do
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
        loan_duration_months = loan_duration * 12
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
    Your loan duration is: #{loan_duration_months} months?
    _______________________________________________
    --If these are correct type 'Y'--
    MSG

    puts correct_params_prompt
    break if gets.chomp.start_with?('y', 'Y')
  end

  # computs payments and converts to $00.00 format
  monthly_payments = loan_ammount * (mpr * (1 + mpr)**loan_duration_months) / \
                     ((1 + mpr)**loan_duration_months - 1)

  monthly_payments = format("%.2f", monthly_payments)

  prompt('work')
  sleep(2)
  prompt('work_done')
  sleep(1)
  puts "=> Your monthly payments come out to: $#{monthly_payments} per month
  over the next #{loan_duration_months} months."
  sleep(2)

  prompt('run_again')
  final_answer = gets.chomp
  break if final_answer.downcase.start_with?('n')
end
