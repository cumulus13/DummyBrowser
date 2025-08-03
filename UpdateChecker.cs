using System;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using System.Reflection;
using System.Windows.Forms;

namespace DummyBrowser
{
    public class UpdateChecker
    {
        private const string GITHUB_API_URL = "https://api.github.com/repos/cumulus13/DummyBrowser/releases/latest";
        private const string GITHUB_RELEASES_URL = "https://github.com/cumulus13/DummyBrowser/releases";

        public static async Task<bool> CheckForUpdatesAsync(bool showNoUpdateDialog = false)
        {
            try
            {
                using (var client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Add("User-Agent", "DummyBrowser-UpdateChecker");
                    
                    var response = await client.GetStringAsync(GITHUB_API_URL);
                    var release = JsonSerializer.Deserialize<GitHubRelease>(response);
                    
                    var currentVersion = Assembly.GetExecutingAssembly().GetName().Version;
                    var latestVersion = new Version(release.tag_name.TrimStart('v'));
                    
                    if (latestVersion > currentVersion)
                    {
                        var result = MessageBox.Show(
                            $"New version available!\n\n" +
                            $"Current: v{currentVersion}\n" +
                            $"Latest: v{latestVersion}\n\n" +
                            $"Release: {release.name}\n" +
                            $"Published: {release.published_at:yyyy-MM-dd}\n\n" +
                            $"Do you want to download the update?",
                            "Update Available",
                            MessageBoxButtons.YesNo,
                            MessageBoxIcon.Information
                        );
                        
                        if (result == DialogResult.Yes)
                        {
                            System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo
                            {
                                FileName = GITHUB_RELEASES_URL,
                                UseShellExecute = true
                            });
                        }
                        
                        return true;
                    }
                    else if (showNoUpdateDialog)
                    {
                        MessageBox.Show(
                            $"You have the latest version (v{currentVersion})",
                            "No Updates Available",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Information
                        );
                    }
                }
            }
            catch (Exception ex)
            {
                if (showNoUpdateDialog)
                {
                    MessageBox.Show(
                        $"Unable to check for updates:\n{ex.Message}",
                        "Update Check Failed",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Warning
                    );
                }
            }
            
            return false;
        }
    }

    public class GitHubRelease
    {
        public string tag_name { get; set; }
        public string name { get; set; }
        public DateTime published_at { get; set; }
        public string html_url { get; set; }
        public bool prerelease { get; set; }
    }
}