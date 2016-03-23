aws=/usr/local/bin/aws
code_path=/home/usharpr/learning-cms-assets/
cd $code_path
git_pull=`git pull origin master`
if [ $? -eq 0 ];then
        ls
  $aws s3 sync styleguide-factmonster/dist s3://styleguide-factmonster/
  $aws s3 sync styleguide-teachervision/dist s3://styleguide-teachervision/
  $aws s3 sync styleguide-familyeducation/dist s3://styleguide-familyeducation/

else
        echo "Git pull is not working"
        exit 0
fi
