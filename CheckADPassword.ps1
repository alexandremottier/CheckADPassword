While(0 -lt 1)
  {
  Function Test-ADAuthentication {
      param($username,$password)
      (new-object directoryservices.directoryentry "",$username,$password).psbase.name -ne $null
  }
  Write-Host -ForegroundColor Yellow "...::: Outil de vérification de mot de passe Active Directory :::..."
  $login = Read-Host "Quel est l'identifiant de la session ?"
  $password = Read-Host "Quel est le mot de passe de la session ?"-AsSecureString

  $password = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password)
  $password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($password)

  $result = Test-ADAuthentication "$login" "$password"

  If($result -eq "True")
    {
        Write-Host -ForegroundColor Green "Le mot de passe AD est correct !"
    }else{
        Write-Host -ForegroundColor Red "Le mot de passe AD est incorrect."
    }
}
