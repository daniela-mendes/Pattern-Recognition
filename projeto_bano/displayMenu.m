function choice = displayMenu(options)

for i = 1:length(options)
    fprintf('%d. %s\n', i, options{i});
end

choice = 0;
while ~any(choice == 1:length(options))
    choice = inputNumber('Please choose a menu input: ');
end