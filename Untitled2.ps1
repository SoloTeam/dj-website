#Get-ChildItem -Path "$env:USERPROFILE" -Recurse -Filter app.py
#cd "$env:USERPROFILE\dj-website"
python app.py 2>$null
#python app.py *>$null