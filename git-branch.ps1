param (
    [Parameter(Mandatory=$true)]
    [string]$BranchName
)

Write-Host "--- Creazione nuovo Branch ---" -ForegroundColor Cyan

# Crea e passa al nuovo branch
Write-Host "Creazione del branch '$BranchName' e passaggio ad esso..." -ForegroundColor Yellow
git checkout -b $BranchName

if ($LASTEXITCODE -eq 0) {
    Write-Host "Branch '$BranchName' creato e attivo!" -ForegroundColor Green
    
    # Opzionale: Suggerimento per il push
    Write-Host "`nPer caricare questo branch su GitHub, usa il comando:" -ForegroundColor Gray
    Write-Host "git push -u origin $BranchName" -ForegroundColor White
} else {
    Write-Host "Errore durante la creazione del branch. Assicurati che il nome sia valido e non esista già." -ForegroundColor Red
}
