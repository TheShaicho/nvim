# My Neovim Config

Αυτή είναι μια σύγχρονη παραμετροποίηση για το Neovim, εστιασμένη στην ανάπτυξη με Go και τεχνολογίες web (HTML, CSS, JavaScript, TypeScript).

## ✨ Χαρακτηριστικά

- **Μοντέρνα Εμφάνιση**: Minimal θέμα και UI components (lualine, bufferline).
- **Γρήγορη Πλοήγηση**: "Fuzzy finding" αρχείων, buffers και κειμένου με το `telescope.nvim`.
- **Έξυπνη Επεξεργασία Κώδικα**:
  - Αυτόματη συμπλήρωση (autocompletion) με το `nvim-cmp`.
  - Υποστήριξη Language Server Protocol (LSP) για diagnostics, definitions κ.α.
  - Αυτόματη εγκατάσταση LSPs και formatters με το `mason.nvim`.
  - Άμεση επισήμανση λαθών με το `trouble.nvim`.
- **Αυτόματο Formatting**: `conform.nvim` για αυτόματο format του κώδικα κατά την αποθήκευση.
- **Ενσωματωμένο Terminal**: Διαχείριση terminal μέσα από το Neovim με το `toggleterm.nvim`.
- **Διαχείριση Sessions**: Αποθήκευση και φόρτωση sessions με το `persistence.nvim`.
- **Live Server**: Ενσωματωμένος live server για web development.

## ⚙️ Προαπαιτούμενα

Πριν την εγκατάσταση, βεβαιωθείτε ότι έχετε τα παρακάτω εργαλεία στο σύστημά σας:

- **[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)** (v0.8.0 ή νεότερη)
- **[Git](https://git-scm.com/downloads)**
- **[Node.js](https://nodejs.org/en/download/)** (και npm)
- **[Go](https://go.dev/doc/install)**
- **[Ripgrep](https://github.com/BurntSushi/ripgrep#installation)** (Απαραίτητο για την αναζήτηση κειμένου του Telescope)
- **Build Tools** (`make`, `gcc`) για την компиляция του `telescope-fzf-native`. Συνήθως εγκαθίστανται με ένα πακέτο όπως το `build-essential` (Debian/Ubuntu) ή `base-devel` (Arch Linux).
- **[Nerd Font](https://www.nerdfonts.com/font-downloads)** (Απαραίτητη για τη σωστή εμφάνιση των εικονιδίων).

## 🚀 Εγκατάσταση

1.  **Δημιουργήστε αντίγραφο ασφαλείας (backup) των παλιών ρυθμίσεων (προαιρετικά):**
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2.  **Κλωνοποιήστε το repository στον φάκελο ρυθμίσεων του Neovim:**
    ```bash
    git clone <URL_του_repository_σας> ~/.config/nvim
    ```

3.  **Ξεκινήστε το Neovim:**
    ```bash
    nvim
    ```
    Κατά την πρώτη εκκίνηση, ο package manager `lazy.nvim` θα εγκαταστήσει αυτόματα όλα τα plugins. Αμέσως μετά, το `mason.nvim` θα εγκαταστήσει τους LSPs και τα formatters. Η διαδικασία μπορεί να πάρει μερικά λεπτά.

## ⌨️ Βασικές Συντομεύσεις

Η παρακάτω λίστα περιγράφει τις κυριότερες συντομεύσεις. Το πλήκτρο `<leader>` είναι ρυθμισμένο στο `Space`.

### Γενική Πλοήγηση & Διαχείριση
| Συντόμευση      | Περιγραφή                                      |
| --------------- | ---------------------------------------------- |
| `j` / `k`         | **Αντιστροφή**: Κίνηση πάνω / κάτω              |
| `;` / `:`         | **Αντιστροφή**: `:` για εντολές, `;` για επανάληψη `f`/`t` |
| `<leader> f`      | Εφαρμογή format στο αρχείο                     |
| `<leader> aa`     | Επιλογή όλου του κειμένου                      |
| `<leader> q`      | Έξυπνο κλείσιμο παραθύρου/buffer               |
| `<C-z>`           | Άνοιγμα/Κλείσιμο terminal (`toggleterm`)       |

### Παράθυρα & Buffers
| Συντόμευση      | Περιγραφή                                      |
| --------------- | ---------------------------------------------- |
| `<leader> v`      | Κάθετο split παραθύρου                         |
| `<leader> h`      | Οριζόντιο split παραθύρου                      |
| `<C-h/j/k/l>`     | Πλοήγηση στα παράθυρα (j/k αντίστροφα)          |
| `<S-h>` / `<S-l>` | Πλοήγηση στο προηγούμενο/επόμενο buffer        |

### Plugins
| Συντόμευση      | Plugin            | Περιγραφή                                    |
| --------------- | ----------------- | -------------------------------------------- |
| `<leader> ff`     | **Telescope**     | Εύρεση αρχείων στο project (`find_files`)    |
| `<leader> ft`     | **Telescope**     | Εύρεση κειμένου στο project (`live_grep`)    |
| `<leader> fb`     | **Telescope**     | Εύρεση ανοιχτών buffers                     |
| `<leader> e`      | **Telescope**     | Άνοιγμα file browser                         |
| `<leader> x`      | **Trouble**       | Άνοιγμα/Κλείσιμο λίστας λαθών/warnings     |
| `<leader> dh`     | **LSP**           | Εμφάνιση του μηνύματος κάτω από τον κέρσορα |
| `<leader> dd`     | **LSP**           | Εμφάνιση documentation                      |
| `<C-x>`           | **live-server**   | Εκκίνηση/Τερματισμός του live server       |

### Sessions
| Συντόμευση      | Plugin            | Περιγραφή                                    |
| --------------- | ----------------- | -------------------------------------------- |
| `<leader> s`      | **Persistence**   | Φόρτωση του τελευταίου session              |
| `<leader> ss`     | **Persistence**   | Επιλογή session για φόρτωση                  |
| `<leader> sq`     | **Persistence**   | Έξοδος χωρίς αποθήκευση του session          |
