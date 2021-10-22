echo "Install dependencies =>"
echo " "

bundle install

echo "Create database =>"
echo " "

rails db:create

echo "Play pending migration =>"
echo " "

rails db:migrate

echo "Add fake data with seeder =>"
echo " " 

rails db:seed