# Aufgabe 1: Verständnisfragen

# 1. Was ist der Vorteil bei der Nutzung von Terraform Modulen?
- Der Vorteil bei der Nutzung von Terraform Modulen besteht darin, dass sie die Wiederverwendbarkeit und Organisation von Terraform-Konfigurationen verbessern. Sie ermöglichen es, komplexe Konfigurationen in kleinere, wiederverwendbare Komponenten zu zerlegen, was die Wartung von Terraform-Konfigurationen erleichtert und die Redundanz zwischen mehreren Terraform-Projekten reduziert.

# 2. Welche Hauptkomponenten sollten in diesem Setup erstellt werden?
Die Hauptkomponenten, die in diesem Setup erstellt werden sollten, sind:
- main.tf: Hier werden die Hauptressourcen definiert.
- variables.tf: Hier werden die Variablen definiert, die im Hauptmodul verwendet werden.
- outputs.tf: Hier werden die Ausgabewerte definiert, die nach der Anwendung von Terraform verfügbar sind.
- versions.tf: Hier werden die Versionen der verwendeten Provider definiert.
- modules/: In diesem Verzeichnis werden die Untermodule gespeichert

# 3. Beschreibe die Projektstruktur eines Terraform Moduls.
´´´  .
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  ├── versions.tf
  ├── modules/
  │  ├── module1/
  │  ├── module2/
  │  ├── ...
´´´
Jedes Modul sollte seine eigene main.tf, variables.tf und outputs.tf Datei haben 

# 4. Welche Rolle spielt die `versions.tf`-Datei im Hauptmodul?
- Die versions.tf-Datei im Hauptmodul spielt eine wichtige Rolle, indem sie die Versionen der verwendeten Provider definiert. Sie ermöglicht es, die Kompatibilität zwischen den verschiedenen Ressourcen sicherzustellen und hilft dabei, Probleme zu vermeiden, die durch Änderungen in den Providern verursacht werden könnten.

# 5. Was ist die Rolle der `variables.tf`-Datei im EC2-Modul?
Die variables.tf-Datei im EC2-Modul definiert die Variablen, die im Modul verwendet werden. Sie ermöglicht es, die Konfiguration des Moduls anzupassen, ohne den Code des Moduls ändern zu müssen.

# 6. Welche Werte werden als Standardwerte für die EC2-Variablen festgelegt?
Die Standardwerte für die EC2-Variablen werden in der variables.tf-Datei im EC2-Modul festgelegt. Diese Werte können dann in der main.tf-Datei des Hauptmoduls überschrieben werden.

# 7. Warum wird in der `ec2/main.tf`-Datei die IAM-Instanzprofilvariable überprüft und gegebenenfalls auf null gesetzt?
In der ec2/main.tf-Datei wird die IAM-Instanzprofilvariable überprüft und gegebenenfalls auf null gesetzt, um sicherzustellen, dass ein gültiges IAM-Instanzprofil bereitgestellt wird. Wenn kein gültiges IAM-Instanzprofil bereitgestellt wird, kann dies dazu führen, dass die EC2-Instanz nicht richtig funktioniert.

# 8. Welche Ausgabevariablen sind in der `ec2/outputs.tf`-Datei definiert?
Die Ausgabevariablen in der ec2/outputs.tf-Datei definieren die Werte, die nach der Anwendung von Terraform verfügbar sind. Sie ermöglichen es, Informationen über die erstellten Ressourcen abzurufen, wie z.B. die IP-Adresse der erstellten EC2-Instanz.

# 9. Was ist die Rolle der `main.tf`-Datei im Hauptmodul?
Die main.tf-Datei im Hauptmodul ist die Hauptkonfigurationsdatei für Terraform. Sie enthält die Definitionen für alle Ressourcen, die von Terraform erstellt werden sollen. Sie kann auch Module aufrufen und Variablen und Ausgaben definieren.

#10. Welche IAM-Ressourcen werden im `iam/main.tf`-Modul erstellt?
Im iam/main.tf-Modul werden IAM-Ressourcen wie Benutzer, Gruppen und Richtlinien erstellt. Beispielsweise kann ein Modul IAM-Benutzer erstellen und ihnen bestimmte Rollen und Berechtigungen zuweisen .

# 11. Wie kann man im Hauptmodul auf Daten eines Modules zugreifen?
Um auf Daten eines Moduls im Hauptmodul zuzugreifen, können Sie die Ausgabe des Moduls verwenden. Die Ausgabe eines Moduls ist eine Art von "Rückgabewert", den das Modul an das Hauptmodul zurückgibt. Sie können auf diese Ausgabe im Hauptmodul zugreifen, indem Sie den Modulnamen und den Namen der Ausgabe verwenden, z.B. module.modulname.outputname.

# 12. Warum ist es notwendig, Terraform nach dem Hinzufügen eines neuen Moduls erneut zu initialisieren?
Terraform muss nach dem Hinzufügen eines neuen Moduls erneut initialisiert werden, um die neuen Ressourcen und Module zu erkennen und die erforderlichen Anpassungen an der Zustandsdatei vorzunehmen.

# 13. Welche Berechtigungen werden der IAM-Rolle in Bezug auf den S3-Bucket zugewiesen?
Die genauen Berechtigungen, die der IAM-Rolle in Bezug auf den S3-Bucket zugewiesen werden, hängen von der spezifischen Richtlinie ab, die der Rolle zugewiesen ist. Beispielsweise kann eine Rolle die Berechtigung haben, Objekte im S3-Bucket zu lesen und zu schreiben, oder sie kann nur die Berechtigung haben, Objekte zu lesen. Dies wird durch die Richtlinie definiert, die der Rolle zugewiesen ist.
