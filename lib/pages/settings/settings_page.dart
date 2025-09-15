import 'package:flutter/material.dart';
import 'change_email_dialog.dart';
import 'change_password_dialog.dart';
import '../providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeProvider>(context, listen: false);
    final localeProv = Provider.of<LocaleProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Cambiar correo electrónico'),
              subtitle: const Text('Actualiza tu correo de usuario'),
              onTap: () => showDialog(
                context: context,
                builder: (_) => const ChangeEmailDialog(),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Cambiar contraseña'),
              subtitle: const Text('Cambia tu contraseña segura'),
              onTap: () => showDialog(
                context: context,
                builder: (_) => const ChangePasswordDialog(),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Cambio de tema'),
              subtitle: const Text('Selecciona tema'),
              onTap: () => _openThemeDialog(context, themeProv),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Cambio de idioma'),
              subtitle: const Text('Selecciona idioma'),
              onTap: () => _openLanguageDialog(context, localeProv),
            ),
          ),
        ],
      ),
    );
  }

  void _openThemeDialog(BuildContext context, ThemeProvider themeProv) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) {
        return Consumer<ThemeProvider>(
          builder: (_, prov, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Sistema'),
                    value: AppThemeType.system,
                    groupValue: prov.current,
                    onChanged: (v) => prov.setThemeMode(AppThemeType.system),
                  ),
                  RadioListTile(
                    title: const Text('Claro'),
                    value: AppThemeType.light,
                    groupValue: prov.current,
                    onChanged: (v) => prov.setThemeMode(AppThemeType.light),
                  ),
                  RadioListTile(
                    title: const Text('Oscuro'),
                    value: AppThemeType.dark,
                    groupValue: prov.current,
                    onChanged: (v) => prov.setThemeMode(AppThemeType.dark),
                  ),
                  RadioListTile(
                    title: const Text('Personalizado'),
                    value: AppThemeType.custom,
                    groupValue: prov.current,
                    onChanged: (v) => prov.setThemeMode(AppThemeType.custom),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _openLanguageDialog(BuildContext context, LocaleProvider localeProv) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Español'),
              onTap: () {
                localeProv.setLocale(const Locale('es'));
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              title: const Text('English'),
              onTap: () {
                localeProv.setLocale(const Locale('en'));
                Navigator.pop(ctx);
              },
            ),
            const SizedBox(height: 6),
          ],
        );
      },
    );
  }
}
