puts "Введите сообщение: "
msg = gets.chomp
system("echo #{msg} | gpg -c > msg.gpg")
