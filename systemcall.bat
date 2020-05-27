@ECHO OFF

set /p db="Instruction : Voulez-vous installer les donnees dans votre BDD ? (Tapez y si oui, sinon tapez autre chose) : "
if %db% == y (
ECHO Instruction : Tapez le mot de passe de votre MySQL, validez avec la touche "Entree" et enfin patientez pendant un instant
cd %PROGRAMFILES%\MySQL\MySQL Server 8.0\bin
mysql -u root -p --default-character-set=utf8 < %~dp0\dicoloco.sql
)

ECHO Instruction : Veuillez a nouveau entrer les informations de votre MySQL 
set /p id="Entrer ID: "
set /p password="Entrer PASSWORD: "

(
	start "task1" cmd /C "cd %~dp0\Front\html & TIMEOUT 25 & dicoloco_accueil.html"
	start "task2" cmd /C "cd %~dp0\Executable & java -jar Dicoloco-0.0.1-SNAPSHOT.jar --app.id=%id% --app.password=%password%"
)

