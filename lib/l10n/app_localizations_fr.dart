// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Assistant IA de Dressage';

  @override
  String get loginTitle => 'Content de vous revoir';

  @override
  String get signupTitle => 'Créer un compte';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get nameLabel => 'Nom complet';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get signupButton => 'S\'inscrire';

  @override
  String get noAccountYet => 'Pas encore de compte ? Inscrivez-vous';

  @override
  String get haveAccountAlready => 'Déjà un compte ? Connectez-vous';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get navCapture => 'Analyser';

  @override
  String get navHistory => 'Historique';

  @override
  String get navLeaderboard => 'Classement';

  @override
  String get navCoach => 'Coach IA';

  @override
  String get captureTitle => 'Analyser une assiette';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get uploadPhoto => 'Choisir dans la galerie';

  @override
  String get analyzeButton => 'Analyser la présentation';

  @override
  String get analyzing => 'Analyse du dressage en cours…';

  @override
  String get retake => 'Reprendre';

  @override
  String get resultTitle => 'Score de présentation';

  @override
  String get outOf100 => '/ 100';

  @override
  String get subscoreComposition => 'Composition';

  @override
  String get subscoreColors => 'Couleurs';

  @override
  String get subscoreGarnish => 'Garniture';

  @override
  String get subscoreCleanliness => 'Propreté';

  @override
  String get subscoreBalance => 'Équilibre';

  @override
  String get strengths => 'Points forts';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get saveToHistory => 'Enregistrer dans l\'historique';

  @override
  String get savedToHistory => 'Enregistré dans votre historique';

  @override
  String get shareResult => 'Partager';

  @override
  String get historyTitle => 'Votre historique';

  @override
  String get noHistoryYet =>
      'Aucune analyse pour le moment. Analysez votre première assiette !';

  @override
  String get historyDeleteConfirm => 'Supprimer cette analyse ?';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String get leaderboardTitle => 'Classement de la cuisine';

  @override
  String get leaderboardEmpty =>
      'Aucun score pour le moment. Soyez le premier à dresser une assiette !';

  @override
  String get leaderboardSubtitle =>
      'Classé selon la moyenne des 10 derniers plats';

  @override
  String get coachTitle => 'Coach IA de dressage';

  @override
  String get coachHint =>
      'Demandez-moi sur les garnitures, les couleurs, les styles…';

  @override
  String get coachSend => 'Envoyer';

  @override
  String get coachWelcome =>
      'Bonjour, je suis votre coach de dressage. Posez-moi vos questions sur la présentation des plats !';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get arabic => 'Arabe';

  @override
  String get errorGeneric => 'Une erreur est survenue. Veuillez réessayer.';

  @override
  String get errorNoImage => 'Veuillez d\'abord prendre ou importer une photo.';

  @override
  String get errorNetwork => 'Erreur réseau. Vérifiez votre connexion.';

  @override
  String get retry => 'Réessayer';

  @override
  String get verdictExcellent => 'Présentation excellente';

  @override
  String get verdictGood => 'Bonne présentation';

  @override
  String get verdictAverage => 'Présentation moyenne';

  @override
  String get verdictNeedsWork => 'À améliorer';
}
