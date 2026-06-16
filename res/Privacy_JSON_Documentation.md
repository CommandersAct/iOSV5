# Privacy JSON Documentation

> **Not using our UI components?** If you are building your own Consent UI instead of using the Commanders Act Privacy Center and/or Banner, you can stop here. `privacy.json` is only consumed by our UI components.

---

## Table of Contents

- [1. Overview](#1-overview)
- [2. IAB and Google AC-String](#2-iab-and-google-ac-string)
- [3. Top-level structure](#3-top-level-structure)
- [4. Language configuration](#4-language-configuration)
- [5. Section reference](#5-section-reference)
  - [5.1 `information`](#51-information)
  - [5.2 `texts`](#52-texts)
    - [5.2.1 `generic`](#521-generic)
    - [5.2.2 `popup` *(IAB only)*](#522-popup-iab-only)
    - [5.2.3 `purposes`](#523-purposes)
    - [5.2.4 `vendors`](#524-vendors)
    - [5.2.5 `banner`](#525-banner)
    - [5.2.6 `others` *(IAB only)*](#526-others-iab-only)
  - [5.3 `components` *(IAB only)*](#53-components-iab-only)
  - [5.4 `customisation`](#54-customisation)
  - [5.5 `categories` and `vendors`](#55-categories-and-vendors)
  - [5.6 `google_consent_mode`](#56-google_consent_mode)
- [6. Validation](#6-validation)
- [7. Full example JSON](#7-full-example-json)

---

## 1. Overview

`privacy.json` is a single configuration file that drives everything the user sees in the Commanders Act Privacy Center and Consent Banner: all text, colours, buttons, and the list of consent categories and vendors.

The file has six top-level keys. Understanding what each one does before reading the per-field detail below will save time:

| Key | Purpose |
|-----|---------|
| `information` | Metadata: version, consent duration, reset behaviour |
| `texts` / `texts_xx` | All UI text strings, per language |
| `components` | Which buttons appear on each consent layer *(IAB only)* |
| `customisation` | Colours and display order |
| `categories` / `categories_xx` | Your custom consent categories |
| `vendors` / `vendors_xx` | Your custom vendors |
| `google_consent_mode` | Maps categories to Firebase consent keys *(optional)* |

---

## 2. IAB and Google AC-String

Some fields are only required when using IAB or Google AC-String. They are marked throughout this document.

**IAB** — [IAB (Interactive Advertising Bureau)](https://iabeurope.eu/) defines the Transparency and Consent Framework (TCF), the industry standard for collecting and communicating user consent for digital advertising. IAB mode is enabled automatically when the TCIAB module is linked — no JSON flag is needed.

**Google AC-String** — A separate consent signal for Google's ad technology providers, complementary to IAB TCF. It can only be used on top of IAB, and is enabled in code by the developer.

Including IAB-specific fields when not using IAB causes no harm. Starting from the [full example JSON](#7-full-example-json) is fine regardless of your setup.

---

## 3. Top-level structure

```json
{
  "information": {},
  "components": {},
  "customisation": {},
  "texts": {},
  "texts_xx": {},
  "categories": [],
  "categories_xx": [],
  "vendors": [],
  "vendors_xx": [],
  "google_consent_mode": {}
}
```

`xx` is a language code, e.g. `texts_fr`, `categories_de`. See [Language configuration](#4-language-configuration).

---

## 4. Language configuration

The language is set by the developer in app code. The SDK then looks up the matching language block in `privacy.json`. If no language is set, or no matching block is found, the default (non-suffixed) block is used.

- `"texts"` — used by default when no language is selected in code.
- `"texts_xx"` — used when the developer selects a language (e.g. `"texts_fr"`, `"texts_de"`).

The same pattern applies to `"categories"` / `"categories_xx"` and `"vendors"` / `"vendors_xx"`.

App-level documentation: [Android](https://github.com/CommandersAct/AndroidV5/tree/master/TCConsent) · [iOS](https://github.com/CommandersAct/iOSV5/tree/master/TCConsent)

> [!IMPORTANT]
> Even if you always select a language in code, a default block is required and must contain the same fields.

---

## 5. Section reference

### 5.1 `information`

General metadata for the consent configuration.

```json
"information": {
  "update": "2021-03-01",
  "version": "5",
  "consentDurationInMonths": "6",
  "vendors": "15,501,2,91",
  "google_vendors": "323,389,385,424",
  "resetSave": "1",
  "significantChanges": "true"
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `update` | ✅ Always | Date of last JSON update |
| `version` | ✅ Always | Version string for this configuration |
| `consentDurationInMonths` | ✅ Always | How long consent remains valid before re-prompting (default: 6) |
| `vendors` | IAB only | Comma-separated list of IAB vendor IDs to include in the vendor list |
| `google_vendors` | AC-String only | Comma-separated list of Google vendor IDs |
| `resetSave` | Optional | Set to `"1"` to delete all saved consent and force re-display of the Privacy Center. Only takes effect the first time the JSON is loaded. Remove or set to `"0"` otherwise. Use when switching from non-IAB to IAB. |
| `significantChanges` | Optional | Set to `"true"` to signal that significant changes were made (e.g. a new category was added), so the Privacy Center is displayed again without deleting existing consent. Only takes effect the first time the JSON is loaded. Remove or set to `"0"` otherwise. |

---

### 5.2 `texts`

All user-facing strings displayed in the Privacy Center and Banner. Organised into sub-sections by screen.

```json
"texts": {
  "generic": {},
  "popup": {},
  "purposes": {},
  "vendors": {},
  "banner": {},
  "others": {}
}
```

---

#### 5.2.1 `generic`

Strings used across multiple screens and components.

| Field | Required | Description |
|-------|----------|-------------|
| `saveButton` | ✅ Always | Label for the "Save" button |
| `acceptAllButton` | ✅ Always | Label for "Accept All" |
| `refuseAllButton` | ✅ Always | Label for "Refuse All" |
| `vendorButton` | ✅ Always | Button switching from purpose screen to vendor screen |
| `purposeButton` | ✅ Always | Button switching from vendor screen to purpose screen |
| `legalButton` | ✅ Always | Button opening the detailed legal explanation on the purposes screen |
| `backButton` | ✅ Always | Label for the back button |
| `consentDef` | ✅ Always | Label next to the switch button for consenting on vendors/categories |
| `partnersLinkText` | ✅ Always | When this value is found in `popup.content`, it is converted into a link that opens the Vendor screen |
| `relatedVendorsButton` | ✅ Always | Label for the button that shows related vendors on a category |
| `detailButton` | IAB only | First-layer button that navigates to the purposes screen |
| `illustrationsButton` | IAB only | Button opening illustrations on the IAB v2.2 purposes screen |
| `purposeDef` | IAB only | Header label above IAB purposes |
| `flexiblePurposeDef` | IAB only | Header label above IAB flexible purposes |
| `specialPurposeDef` | IAB only | Header label above IAB special purposes |
| `featureDef` | IAB only | Header label above IAB features |
| `specialFeatureDef` | IAB only | Header label above IAB special features |
| `dataCategoriesDef` | IAB only | Label for the IAB Data Categories title |
| `legIntPurposeDef` | IAB only | Label for the "Legitimate Interest" button |
| `mandatoryDef` | Optional | Label next to the switch for a mandatory category (required if you use `isMandatory` on any category) |
| `month` | IAB only | Used to display cookie lifetime (e.g. "month") |
| `day` | IAB only | Used to display cookie lifetime (e.g. "day") |
| `seconds` | IAB only | Used to display cookie lifetime (e.g. "seconds") |
| `hours` | IAB only | Used to display cookie lifetime (e.g. "hours") |

---

#### 5.2.2 `popup` *(IAB only)*

The IAB first-layer screen inside the Privacy Center. Only shown when the TCIAB module is linked.

```json
"popup": {
  "title": "We respect your privacy",
  "content": "We and our {total_number} partners use technologies...",
  "purposeTitle": "We and our {total_number} partners:",
  "specialPurposeTitle": "We have legitimate interest for these purposes:",
  "featureTitle": "For some purposes we use:",
  "specialFeatureTitle": "Special features include:"
}
```


| Field | Required | Description |
|-------|----------|-------------|
| `title` | IAB only | Title displayed on the first-layer popup screen |
| `content` | IAB only | Main descriptive text |
| `purposeTitle` | IAB only | Section title for IAB purposes |
| `specialPurposeTitle` | IAB only | Section title for IAB special purposes |
| `featureTitle` | IAB only | Section title for IAB features |
| `specialFeatureTitle` | IAB only | Section title for IAB special features |

> [!IMPORTANT]
> `{total_number}` is automatically replaced with the total count of IAB vendors. and it is required to have in your text.

---

#### 5.2.3 `purposes`

Strings for the purposes screen (second layer).

```json
"purposes": {
  "title": "Find out more...",
  "content": "You can set your consent preferences...",
  "privacy_policy_text": "Check our privacy policies",
  "privacy_policy_url": "https://ourcompany.com/privacypolicies",
  "consent_id_text": "User ID"
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `title` | ✅ Always | Introductory heading for the purposes screen |
| `content` | ✅ Always | Descriptive paragraph below the title |
| `privacy_policy_text` | ✅ Always | Label for the privacy policy link |
| `privacy_policy_url` | ✅ Always | URL for the privacy policy |
| `consent_id_text` | IAB only | Label displayed next to the user consent ID |

---

#### 5.2.4 `vendors`

Strings for the vendors screen.

```json
"vendors": {
  "title": "See the partners we work with.",
  "content": "You can set consent preferences for individual partners...",
  "privacyPolicyText": "Privacy Policy",
  "deviceStorageTitle": "Storage Type:",
  "deviceStorageCookieLifetime": "Cookie lifetime:",
  "deviceStorageOther": "Others",
  "deviceStorageCookies": "Cookies",
  "googleVendorsDef": "Google Ad Technology Providers",
  "domainsDef": "Domain list",
  "IABVendorsDef": "IAB TCF Vendors",
  "legIntClaimTitle": "Legitimate interest policy"
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `title` | ✅ Always | Introductory heading for the vendors screen |
| `content` | ✅ Always | Descriptive paragraph below the title |
| `privacyPolicyText` | IAB only | Label for the privacy policy link on each vendor row |
| `deviceStorageTitle` | IAB only | Label for the storage type row |
| `deviceStorageCookieLifetime` | IAB only | Label for the cookie lifetime row |
| `deviceStorageOther` | IAB only | Label for non-cookie storage types |
| `deviceStorageCookies` | IAB only | Label for cookie storage type |
| `googleVendorsDef` | IAB only (AC-String) | Title for the Google vendors section |
| `domainsDef` | IAB only (AC-String) | Title for the Google domains list |
| `IABVendorsDef` | IAB only | Title for the IAB vendors list |
| `legIntClaimTitle` | IAB only | Title for the legitimate interest policies section |

---

#### 5.2.5 `banner`

Texts for the Consent Banner. Only used when `showBanner()` is called from code.

```json
"banner": {
  "title": "We respect your privacy",
  "content": "Your Privacy matters...",
  "dismissButtonText": "Continue without accepting",
  "acceptButtonText": "Accept",
  "detailsButtonText": "Details",
  "privacyPolicyText": "Privacy Policy",
  "privacyPolicyUrl": "https://www.commandersact.com"
}
```

| Field | Description |
|-------|-------------|
| `title` | Title text displayed in the banner |
| `content` | Main descriptive text |
| `dismissButtonText` | Text on the dismiss button (triggers refuse-all) |
| `acceptButtonText` | Text on the accept button |
| `detailsButtonText` | Text on the details button (opens Privacy Center or custom screen) |
| `privacyPolicyText` | Label for the privacy policy link |
| `privacyPolicyUrl` | URL for the privacy policy |

---

#### 5.2.6 `others` *(IAB only)*

Section titles for custom (non-IAB) categories and vendors when displayed alongside IAB content.

```json
"others": {
  "title_purpose": "Other categories",
  "title_vendors": "Other vendors"
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `title_purpose` | IAB only | Heading for the custom categories section on the purposes screen |
| `title_vendors` | IAB only | Heading for the custom vendors section on the vendors screen |

---

### 5.3 `components` *(IAB only)*

Defines which buttons appear on each layer of the Privacy Center, and in what order. Only required when using IAB (TCIAB module linked).

```json
"components": {
  "firstLayerButton": ["RefuseAll", "Detail", "AcceptAll"],
  "secondLayerButton": ["RefuseAll", "Save", "AcceptAll"]
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `firstLayerButton` | IAB only | Buttons on the first layer, in display order |
| `secondLayerButton` | IAB only | Buttons on the second layer, in display order |

Changing the order of items changes how they appear left-to-right in the UI.

---

### 5.4 `customisation`

Controls colours and, when using IAB, the display order of custom vs IAB content.

```json
"customisation": {
  "content": {
    "fontcolor": "#FFFFFF",
    "backgroundcolor": "#111215",
    "bordercolor": "#414142"
  },
  "button": {
    "fontcolor": "#ffffff",
    "backgroundcolor": "#0A78E3",
    "disabledBackground": "#aeb5bb",
    "linkcolor": "#0A78E3"
  },
  "order": ["Custom", "IAB"]
}
```

**`content`**

| Field | Required | Description |
|-------|----------|-------------|
| `fontcolor` | ✅ Always | Text colour for paragraphs and labels |
| `backgroundcolor` | ✅ Always | Background colour of the content area |
| `bordercolor` | ✅ Always | Border colour for category and vendor blocks |

**`button`**

| Field | Required | Description |
|-------|----------|-------------|
| `fontcolor` | ✅ Always | Text colour inside buttons |
| `backgroundcolor` | ✅ Always | Default button background colour |
| `linkcolor` | ✅ Always | Colour for link-style buttons |
| `disabledBackground` | IAB only | Button colour when disabled (e.g. Accept All is disabled until the user scrolls through the IAB first layer) |

**`order`** *(IAB only)*

Controls whether custom categories appear before or after IAB content in the second layer.

```json
"order": ["Custom", "IAB"]
```

---

### 5.5 `categories` and `vendors`

Declares your custom consent categories and vendors. These appear in the Privacy Center alongside IAB content (if IAB is enabled).

> **Non-IAB:** `categories` must be present and non-empty — it is the only source of consent choices.  
> **IAB:** `categories` is optional. IAB purposes and vendors are loaded from the IAB vendor list automatically.

```json
"categories": [
  {
    "name": "Statistics",
    "ID": "1",
    "isMandatory": "true",
    "related_vendors": [1],
    "description": "These cookies help us analyze user behavior."
  },
  {
    "name": "Big category",
    "ID": "30",
    "description": "Parent category.",
    "subcategories": [
      { "name": "GA", "ID": "31", "description": "Google Analytics." },
      { "name": "Xiti", "ID": "32", "description": "AT Internet." }
    ]
  }
],
"vendors": [
  {
    "name": "Commanders Act",
    "ID": "1",
    "description": "Allow Commanders Act",
    "privacy_policy": "http://commandersact.com/privacypolicy"
  }
]
```

**Category fields**

| Field | Required | Description |
|-------|----------|-------------|
| `name` | ✅ Always | Display name |
| `ID` | ✅ Always | Unique string identifier. Keep IDs between 1 and 999. |
| `description` | ✅ Always | Explanatory text shown to the user |
| `isMandatory` | Optional | Set to `"true"` to prevent the user from toggling this category off. Only custom categories can be mandatory. Also requires `mandatoryDef` to be set in `texts.generic`. |
| `related_vendors` | Optional | Array of vendor IDs (integers) linked to this category |
| `subcategories` | Optional | Array of sub-category objects (same `name`, `ID`, `description` fields). If subcategories are used, only subcategories can be marked as mandatory — this automatically makes the parent mandatory too. |

**Vendor fields**

| Field | Required | Description |
|-------|----------|-------------|
| `name` | ✅ Always | Display name |
| `ID` | ✅ Always | Unique string identifier |
| `description` | ✅ Always | Explanatory text shown to the user |
| `privacy_policy` | ✅ Always | URL to the vendor's privacy policy |

---

### 5.6 `google_consent_mode`

Used to forward consent to Firebase Analytics via Google Consent Mode. Requires the `TCFirebaseDestination` library.

```json
"google_consent_mode": {
  "use_consent_mode": true,
  "infer_ad_from_tcf": false,
  "category_mapping": {
    "ad_storage": 1,
    "ad_user_data": 2,
    "ad_personalization": 3,
    "analytics_storage": 4
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| `use_consent_mode` | boolean | Enables consent forwarding to Firebase |
| `infer_ad_from_tcf` | boolean | When `true` (IAB only), the three `ad_*` keys are mapped automatically from the TCF consent string; the `category_mapping` entries for those keys are ignored |
| `category_mapping.ad_storage` | int | Maps Firebase `ad_storage` to a custom category ID |
| `category_mapping.ad_user_data` | int | Maps Firebase `ad_user_data` to a custom category ID |
| `category_mapping.ad_personalization` | int | Maps Firebase `ad_personalization` to a custom category ID |
| `category_mapping.analytics_storage` | int | Maps Firebase `analytics_storage` to a custom category ID |

Category IDs must match IDs defined in your `categories` (or `categories_xx`) array.

---

## 6. Validation

Always validate your JSON before deploying.

**Generic JSON syntax:** [https://jsonlint.com/](https://jsonlint.com/)

**Commanders Act field validator** — checks for missing or incorrect values against this documentation:
[https://cdn.tagcommander.com/mobile/json_analyzer.html](https://cdn.tagcommander.com/mobile/json_analyzer.html)

> The validator is a helper tool. This documentation is the authoritative reference.

---

## 7. Full example JSON

A complete working example covering both IAB and non-IAB fields. Use it as a starting template and adjust values as needed.

> **Before adding to your app bundle:** rename the file to simply `privacy.json`.

**Download IAB template:** [iab.json](./iab.json)  
**Download non-IAB template:** [non-iab.json](./non-iab.json)

```json
{
  "information": {
    "update": "2021-08-01",
    "version": "1",
    "vendors": "8,241",
    "google_vendors": "323,389,385,424",
    "consentDurationInMonths": 6,
    "significantChanges": "",
    "resetSave": ""
  },
  "components": {
    "firstLayerButton": ["RefuseAll", "Detail", "AcceptAll"],
    "secondLayerButton": ["RefuseAll", "Save", "AcceptAll"]
  },
  "customisation": {
    "content": {
      "fontcolor": "#000000",
      "backgroundcolor": "#ffffff",
      "bordercolor": "#806423"
    },
    "button": {
      "fontcolor": "#ffffff",
      "backgroundcolor": "#4287f5",
      "disabledBackground": "#E1E1E1",
      "linkcolor": "#0907F7"
    },
    "order": ["Custom", "IAB"]
  },
  "texts": {
    "generic": {
      "saveButton": "Save & Exit",
      "detailButton": "Details",
      "acceptAllButton": "Accept All",
      "refuseAllButton": "Refuse All",
      "vendorButton": "Vendors",
      "purposeButton": "Purposes",
      "legalButton": "Legals",
      "illustrationsButton": "show illustrations",
      "backButton": "Back",
      "purposeDef": "Purposes",
      "consentDef": "Consent",
      "legIntPurposeDef": "Legitimate Interest",
      "flexiblePurposeDef": "Flexible Purpose",
      "specialPurposeDef": "Special Purpose",
      "featureDef": "Features",
      "specialFeatureDef": "Special Features",
      "dataCategoriesDef": "Data Categories",
      "partnersLinkText": "our partners",
      "relatedVendorsButton": "show related vendors",
      "month": "month",
      "day": "day",
      "seconds": "seconds",
      "hours": "hours"
    },
    "popup": {
      "title": "We respect your privacy",
      "content": "We and our {total_number} partners use technologies, such as cookies, and process personal data, such as IP addresses and cookie identifiers, to personalise ads and content based on your interests, measure the performance of ads and content, and derive insights about the audiences who saw ads and content. Click below to consent to the use of this technology and the processing of your personal data for these purposes. You can change your mind and change your consent choices at any time by returning to this site.",
      "purposeTitle": "We and our partners:",
      "specialPurposeTitle": "We need your consent for all the purposes above, but we have legitimate interest for these purposes:",
      "featureTitle": "For some of the purposes above we and our partners:",
      "specialFeatureTitle": "For some of the purposes above we and our partners:"
    },
    "purposes": {
      "title": "Find out more about how your personal data is processed and set your preferences below.",
      "content": "You can set your consent preferences and determine how you want your data to be used based on the purposes below. You may set your preferences for us independently from those of third-party partners. Each purpose has a description so that you know how we and partners use your data.",
      "privacy_policy_text": "Check our privacy policies",
      "privacy_policy_url": "https://ourcompany.com/privacypolicies",
      "consent_id_text": "ID of user consent"
    },
    "vendors": {
      "title": "See the partners we work with below. Expand each one to see how they process your data.",
      "content": "You can set consent preferences for individual third-party partners we work with below. Expand each company list item to see what purposes they use data for to help make your choices. In some cases, companies may use your data without asking for your consent, based on their legitimate interests. You can click on their privacy policy links for more information and to object to such processing.",
      "privacyPolicyText": "Privacy Policy",
      "deviceStorageTitle": "Storage Type:",
      "deviceStorageCookieLifetime": "Cookie lifetime: ",
      "deviceStorageOther": "Others",
      "deviceStorageCookies": "Cookies",
      "googleVendorsDef": "Google Ad Technology Providers",
      "domainsDef": "Domain list",
      "IABVendorsDef": "IAB TCF Vendors",
      "legIntClaimTitle": "Legitimate interest policy"
    },
    "banner": {
      "title": "We respect your privacy",
      "content": "Your Privacy matters. We protect your data with strict security measures and never share it without your permission.",
      "dismissButtonText": "Continue without accepting",
      "acceptButtonText": "Accept",
      "detailsButtonText": "Details",
      "privacyPolicyText": "privacy policy",
      "privacyPolicyUrl": "https://www.commandersact.com/"
    },
    "others": {
      "title_purpose": "Other categories EN",
      "title_vendors": "Other vendors EN"
    }
  },
  "texts_fr": {
    "generic": {
      "saveButton": "J'accepte",
      "detailButton": "Détail",
      "acceptAllButton": "Tout Accepter",
      "refuseAllButton": "Tout Refuser",
      "vendorButton": "Afficher les partenaires",
      "purposeButton": "Afficher les finalités",
      "legalButton": "Informations légales",
      "illustrationsButton": "show illustrations",
      "backButton": "Retour",
      "purposeDef": "Finalités",
      "consentDef": "Consentement",
      "legIntPurposeDef": "Intérêts légitimes",
      "flexiblePurposeDef": "Finalités flexibles",
      "specialPurposeDef": "Finalités spéciales",
      "featureDef": "Fonctionnalités",
      "specialFeatureDef": "Fonctionnalités spéciales",
      "dataCategoriesDef": "Categories de Data",
      "partnersLinkText": "nos partenaires",
      "relatedVendorsButton": "Voir les partenaires",
      "month": "mois",
      "day": "jours",
      "seconds": "secondes",
      "hours": "heures"
    },
    "popup": {
      "title": "Le respect de votre vie privée est notre priorité",
      "content": "Nous et nos {total_number} partenaires pouvons stocker et/ou accéder à des informations sur un appareil, utiliser des données limitées pour sélectionner la publicité, créer des profils pour la publicité personnalisée, utiliser des profils pour sélectionner des publicités personnalisées, mesurer la performance des publicités, mesurer la performance des contenus, comprendre les publics par le biais de statistiques ou de combinaisons de données provenant de différentes sources, développer et améliorer les services, créer des profils de contenus personnalisés, utiliser des profils pour sélectionner des contenus personnalisés, utiliser des données limitées pour sélectionner le contenu. Ces technologies peuvent traiter des données personnelles comme l'adresse IP et les données de navigation pour assurer la sécurité, prévenir et détecter la fraude et réparer les erreurs, fournir et présenter des publicités et du contenu, enregistrer et communiquer les choix en matière de confidentialité. Elles peuvent mettre en correspondance et combiner des données à partir d’autres sources de données, relier différents appareils, identifier les appareils en fonction des informations transmises automatiquement. Elles peuvent analyser activement les caractéristiques de l’appareil pour l’identification, utiliser des données de géolocalisation précises.",
      "purposeTitle": "Gérer vos préférences",
      "specialPurposeTitle": "Gérer vos special purposes",
      "featureTitle": "Gérer vos features",
      "specialFeatureTitle": "Gérer vos specialFeatures"
    },
    "purposes": {
      "title": "Gérer vos préférences P",
      "content": "Nos partenaires P et nous déposons des cookies afin d'assurer la sécurité...",
      "privacy_policy_text": "Notre politique de confidentialité",
      "privacy_policy_url": "https://ourcompany.com/privacypolicies",
      "consent_id_text": "ID d'utilisateur"
    },
    "vendors": {
      "title": "Gérer vos préférences V",
      "content": "Nos partenaires V et nous déposons des cookies...",
      "privacyPolicyText": "Politique de confidentialité",
      "deviceStorageTitle": "Type de stockage:",
      "deviceStorageCookieLifetime": "Durée du cookie: ",
      "deviceStorageOther": "Autres",
      "deviceStorageCookies": "Cookies",
      "googleVendorsDef": "Partenaires Google Ad Technology",
      "domainsDef": "liste des domaines utilisés",
      "IABVendorsDef": "liste des partenaires IAB",
      "legIntClaimTitle": "Politique de legitimate"
    },
    "banner": {
      "title": "On respecte ta vie privée",
      "content": "Ta vie privée, c'est sacré. Tes données sont bien gardées, juré promis, et jamais partagées sans ton OK.",
      "dismissButtonText": "Continuer en mode rebelle",
      "acceptButtonText": "J'accepte",
      "detailsButtonText": "Détails",
      "privacyPolicyText": "privacy policy",
      "privacyPolicyUrl": "https://www.commandersact.com/"
    },
    "others": {
      "title_purpose": "Other categories FR",
      "title_vendors": "Other vendors FR"
    }
  },
  "categories": [
    {
      "name": "Statistics",
      "ID": "1",
      "isMandatory": "true",
      "related_vendors": [1],
      "description": "These cookies allow us analyze user behavior on the site, measure and improve performance and the quality of our service."
    },
    {
      "name": "Advertising",
      "ID": "2",
      "related_vendors": [2],
      "description": "These cookies allow us display adverts matching your interests on the websites you visit."
    },
    {
      "name": "Big category",
      "ID": "30",
      "description": "Here you can select the vendors.",
      "subcategories": [
        { "name": "GA", "ID": "31", "description": "Should we send information to GA." },
        { "name": "Xiti", "ID": "32", "description": "Should we send information to AT Internet." },
        { "name": "Vendor3", "ID": "33", "related_vendors": [1, 2], "description": "Should we send information to this vendor3." }
      ]
    }
  ],
  "vendors": [
    {
      "name": "Commanders Act",
      "ID": "1",
      "description": "Allow Commanders Act",
      "privacy_policy": "http://commandersact.com/privacypolicy"
    },
    {
      "name": "Another Vendor",
      "ID": "2",
      "description": "The desc of another vendor",
      "privacy_policy": "http://anothervendor.free.fr/privacypolicy"
    }
  ],
  "categories_fr": [
    {
      "name": "Statistiques",
      "ID": "1",
      "related_vendors": [1],
      "description": "Avec cette catégorie on remonte les stats."
    },
    {
      "name": "Pub",
      "ID": "2",
      "related_vendors": [2],
      "description": "Pour afficher de superbes pubs personalisées"
    },
    {
      "name": "Super cat",
      "ID": "30",
      "description": "Une super cat.",
      "subcategories": [
        { "name": "Sous cat 1", "ID": "31", "description": "Mais on peut choisir que cette sous cat." },
        { "name": "Sous cat 2", "ID": "32", "description": "Ou alors uniquement celle-ci." },
        { "name": "Sous cat 3", "ID": "33", "related_vendors": [1, 2], "description": "Ou plus en fait, mais la 3 c'est pareil." }
      ]
    }
  ],
  "vendors_fr": [
    {
      "name": "Commanders Act",
      "ID": "1",
      "description": "Permettre à Commanders Act d'envoyer des informations",
      "privacy_policy": "http://commandersact.com/privacypolicy"
    },
    {
      "name": "Autre Vendors",
      "ID": "2",
      "description": "Permettre à cet autre vendor d'envoyer pleins d'informations",
      "privacy_policy": "http://anothervendor.free.fr/privacypolicy"
    }
  ]
}
```