Add-Type -AssemblyName System.Device
$geoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher
$geoWatcher.Start()
Start-Sleep -Seconds 2  # wait for location fix
$coord = $geoWatcher.Position.Location
if ($coord.IsUnknown) {
    Write-Output "Location unknown"
} else {
    Write-Output "Latitude: $($coord.Latitude) Longitude: $($coord.Longitude)"
}
$geoWatcher.Stop()
