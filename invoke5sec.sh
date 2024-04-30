get_statistics(){
  cmd=$(curl --request GET "http://127.0.0.1:5001/statistics" >> data.txt)
  echo cmd
}

for ((;;))
do
  get_statistics
  echo "Бесконечный цикл, нажмите CTRL+C для выхода"
  sleep 5
done
ka
