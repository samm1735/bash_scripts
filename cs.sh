

create_flask_structure(){
	local app_name=$1

	mkdir $app_name
	cd $app_name

	mkdir static templates
	mkdir static/css static/js

	touch app.py models.py forms.py requirements.txt

	touch static/css/style.css static/js/script.js
	
	touch templates/layout.html
	touch templates/indexhtml

	#PACKAGES MANAGEMENT

	# python3 -m venv myenv
	# source myenv/bin/activate

	touch requirements.txt

	echo -e "flask\nflask_sqlalchemy\nflask_migrate\nflask_mail\nflask_wtf\npsycopg2\nflask_restful\nflask_jwt_extended\nflask_cors\nflask_bcrypt\nflask_marshmallow\nflask_socketio\nflask_admin\nflask_login\nflask_redis\nflask_caching\nflask_testing\nselenium" > requirements.txt

	# pip list
  while read -r package; do
    if pip show "$package" >/dev/null 2>&1; then
        echo "$package is already installed."
    else
    	echo -e "\t\t\t\tNEWLY INSTALLED\n$package\n" > installed.txt
        echo "Installing $package..."
        pip install "$package"
    fi
  done < requirements.txt

    echo -e "\n\nFolder structure for \"$app_name\" created successfully"
    # deactivate
}



# Check if the app name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide an app name."
  exit 1
fi

# Get the app name from the command-line argument
app_name=$1

# Call the function with the provided app name
create_flask_structure "$app_name"
