using System;
using System.IO;
using System.Windows.Forms;
using System.Text.Json;

namespace DummyBrowser
{
    public class Config
    {
        public bool ShowPrompt { get; set; } = true;
        public string AppName { get; set; } = "Link Clipboard Manager";
        public bool ShowSuccessMessage { get; set; } = true;
    }

    class Program
    {
        private static Config LoadConfig()
        {
            string configPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "config.json");
            
            try
            {
                if (File.Exists(configPath))
                {
                    string jsonString = File.ReadAllText(configPath);
                    return JsonSerializer.Deserialize<Config>(jsonString) ?? new Config();
                }
            }
            catch (Exception ex)
            {
                // Jika error loading config, gunakan default dan buat config baru
                Console.WriteLine($"Error loading config: {ex.Message}");
                Console.WriteLine("Using default configuration...");
            }

            // Buat config default jika tidak ada
            var defaultConfig = new Config();
            SaveConfig(defaultConfig);
            return defaultConfig;
        }

        private static void SaveConfig(Config config)
        {
            try
            {
                string configPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "config.json");
                var options = new JsonSerializerOptions { WriteIndented = true };
                string jsonString = JsonSerializer.Serialize(config, options);
                File.WriteAllText(configPath, jsonString);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error saving config: {ex.Message}");
            }
        }

        [STAThread]
        static void Main(string[] args)
        {
            // Load configuration
            Config config = LoadConfig();

            // Pastikan aplikasi dapat menggunakan clipboard
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            string url = "";
            
            // Ambil URL dari command line arguments
            if (args.Length > 0)
            {
                url = args[0];
                
                // Bersihkan URL jika ada protokol tambahan
                if (url.StartsWith("\"") && url.EndsWith("\""))
                {
                    url = url.Substring(1, url.Length - 2);
                }
            }
            else
            {
                Console.WriteLine("No URL provided");
                Console.WriteLine("Press any key to exit...");
                Console.ReadKey();
                return;
            }

            bool shouldCopy = true;

            // Tampilkan prompt jika diaktifkan dalam config
            if (config.ShowPrompt)
            {
                DialogResult result = MessageBox.Show(
                    $"URL: {url}\n\nDo you want to copy this link to clipboard?",
                    $"Copy Link - {config.AppName}",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question
                );

                shouldCopy = (result == DialogResult.Yes);
            }

            if (shouldCopy)
            {
                try
                {
                    // Copy ke clipboard
                    Clipboard.SetText(url);
                    
                    if (config.ShowSuccessMessage)
                    {
                        MessageBox.Show(
                            "Link copied to clipboard successfully!",
                            "Success",
                            MessageBoxButtons.OK,
                            MessageBoxIcon.Information
                        );
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(
                        $"Failed to copy to clipboard: {ex.Message}",
                        "Error",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error
                    );
                }
            }
        }
    }
}