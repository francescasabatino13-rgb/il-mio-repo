param (
    [Parameter(Mandatory=$true)]
    [string]$Message
)

Write-Host "--- Inizio processo Git ---" -ForegroundColor Cyan

# Aggiungi tutte le modifiche
Write-Host "1. Aggiunta file..." -ForegroundColor Yellow
git add .

# Esegui il commit
Write-Host "2. Esecuzione commit con messaggio: '$Message'..." -ForegroundColor Yellow
git commit -m "$Message"

# Verifica se il commit è andato a buon fine
if ($LASTEXITCODE -eq 0) {
    # Esegui il push
    Write-Host "3. Caricamento su GitHub (push)..." -ForegroundColor Yellow
    git push
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "--- Operazione completata con successo! ---" -ForegroundColor Green
    } else {
        Write-Host "Errore durante il push." -ForegroundColor Red
    }
} else {
    Write-Host "Nessuna modifica da committare o errore nel commit." -ForegroundColor Red
}
