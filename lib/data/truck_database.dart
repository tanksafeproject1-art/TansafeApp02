class TruckData {
  final String shield;
  final String optimum;
  final String drainSafe;
  final String senderSafe;
  final String notes;

  TruckData({
    required this.shield,
    required this.optimum,
    required this.drainSafe,
    required this.senderSafe,
    required this.notes,
  });
}

class TankSafeDatabase {
  static const String contactInfo = '''
Contact TankSafe for more information:
• Email: info@tanksafe.co.za
• Website: www.tanksafe.co.za
• Phone: 031 566 2919
• Cathy Gilmour: 083 254 4596
''';

  // Device recommendation based on neck specifications
  static Map<String, List<String>> getDeviceBySpecs(String neckId, String lugs) {
    switch (neckId.toLowerCase()) {
      case '35mm':
        if (lugs == '2') return {'shield': ['TISS083', 'TISS084'], 'optimum': []};
        break;
      case '40mm':
        if (lugs == '2') return {'shield': ['TISS047'], 'optimum': []};
        break;
      case '50mm':
      case '48mm':
        return {'shield': ['TISS022'], 'optimum': []};
      case '60mm':
        if (lugs == '2') return {'shield': ['TISS032'], 'optimum': []};
        if (lugs.toLowerCase().contains('internal screw')) return {'shield': ['TISS053'], 'optimum': []};
        break;
      case '65mm':
        if (lugs.toLowerCase().contains('internal screw')) return {'shield': ['TISS009'], 'optimum': ['TISS510']};
        break;
      case '70mm':
        if (lugs == '2') return {'shield': ['TISS063'], 'optimum': []};
        break;
      case '80mm':
        if (lugs == '2') return {'shield': ['TISS006'], 'optimum': ['TISS500']};
        if (lugs == '3') return {'shield': ['TISS016'], 'optimum': ['TISS520']};
        if (lugs == '4') return {'shield': ['TISS057'], 'optimum': ['TISS540']};
        break;
      case '90mm':
        if (lugs == '3') return {'shield': ['TISS066'], 'optimum': ['TISS560']};
        if (lugs.toLowerCase().contains('external screw')) return {'shield': ['TISS054'], 'optimum': ['TISS550']};
        break;
    }
    return {'shield': [], 'optimum': []};
  }

  static final Map<String, Map<String, Map<String, TruckData>>> database = {
    'DAF': {
      'XF106': {
        '2022': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD450L(465w)', notes: 'Instrap 465mm/Out Strap 600mm'),
      },
      'XF': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'DAF Main/DAF Second', notes: ''),
      },
      'XF 530 FTT Heavy Hauler': {
        '2024': TruckData(shield: 'TISS006', optimum: '', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'CF 430 FTT Lean': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'CF 480 FTT ToughX': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'XF 480 FTT Smart': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'XF 480 FTT Premium': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'XF 530 FTT Power': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
      'XF 530 FTT Superspace': {
        '2024': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '2 tanks: 445L each, 80mm neck, 2-lug'),
      },
    },
    'Eicher': {
      'PRO3008': {
        '2020': TruckData(shield: 'No Solution', optimum: 'No Solution', drainSafe: '', senderSafe: '', notes: 'Looks small about 40mm/2lug'),
        '2021': TruckData(shield: 'No Solution', optimum: 'No Solution', drainSafe: '', senderSafe: '', notes: 'Looks small about 40mm/2lug'),
        '2022': TruckData(shield: 'No Solution', optimum: 'No Solution', drainSafe: '', senderSafe: '', notes: 'Looks small about 40mm/2lug'),
      },
      'PRO2080': {
        '2020': TruckData(shield: 'TISS084', optimum: '', drainSafe: '', senderSafe: '', notes: '35mm neck, 2-lug, 60mm OD'),
        '2021': TruckData(shield: 'TISS084', optimum: '', drainSafe: '', senderSafe: '', notes: '35mm neck, 2-lug, 60mm OD'),
        '2022': TruckData(shield: 'TISS084', optimum: '', drainSafe: '', senderSafe: '', notes: '35mm neck, 2-lug, 60mm OD'),
      },
    },
    'FAW': {
      '6.130FL': {
        '2023': TruckData(shield: 'TISS083F', optimum: '', drainSafe: 'M14', senderSafe: '400 X 190 X 60', notes: 'TS needs 1.5 mm machined off the inside lip'),
      },
      '8.140FL': {
        '2023': TruckData(shield: 'TISS083F', optimum: '', drainSafe: 'M14', senderSafe: '400 X 190 X 60', notes: 'TS needs 1.5 mm machined off the inside lip - SHEER BOLTS'),
      },
      '15.180FD': {
        '2023': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: 'M14', senderSafe: 'SS SMALL 139 x 220-400', notes: '90mm neck, 3 lugs, 385mm instrap'),
      },
      '15.220FL': {
        '2023': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: 'M14', senderSafe: 'SS SMALL 139 x 220-400', notes: '90mm neck, 3 lugs'),
      },
      'JH6 500HP': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M16', senderSafe: '', notes: '80mm neck, 2 lugs, 380mm instrap'),
      },
      '28.380': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M16', senderSafe: 'HAS OE COVER', notes: '80mm neck, 2 lugs'),
      },
      'JH6 420HP': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M16', senderSafe: 'SS SMALL 139 x 220-400', notes: '80mm neck, 2 lugs'),
      },
      '33.340': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 480mm instrap'),
      },
      'JK6 220': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M16', senderSafe: '', notes: '80mm neck, 2 lugs, 420mm instrap'),
      },
      '28.290FL': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: 'HAS OE COVER', notes: '80mm neck, 2 lugs, 465mm instrap'),
      },
      '28.500FT': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '390 X 200 X 60', notes: '80mm neck, 2 lugs, 2 tanks'),
      },
      'JH6 28.550FT': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: 'SS - ADJ Large', notes: '80mm neck, 2 lugs, 485 inside strap 710 outside strap'),
      },
      'J5N 33.420FT 6×4': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M16', senderSafe: '', notes: '80mm neck, 2 lugs, 385mm inside strap 555 outside strap'),
      },
    },
    'Freightliner': {
      'Argosy': {
        '2020': TruckData(shield: 'TISS57', optimum: 'TISS540', drainSafe: '', senderSafe: '1070mm', notes: '4 lugs, 8mm head self tappers'),
        '2021': TruckData(shield: 'TISS57', optimum: 'TISS540', drainSafe: '', senderSafe: '1070mm', notes: '4 lugs, 8mm head self tappers'),
        '2022': TruckData(shield: 'TISS57', optimum: 'TISS540', drainSafe: '', senderSafe: '1070mm', notes: '4 lugs, 8mm head self tappers'),
      },
    },
    'FUSO': {
      'FA9-137 L': {
        '2023': TruckData(shield: 'TISS006', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 200L tank'),
      },
      'FA9-137 S': {
        '2023': TruckData(shield: 'TISS006', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 200L tank'),
      },
      'FE 4-130 AMT': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FE 6-109': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FE 6-130 TF': {
        '2020': TruckData(shield: 'TISS63', optimum: '', drainSafe: '', senderSafe: '', notes: '70mm neck, Top of lug needs to be trimmed 2mm'),
        '2021': TruckData(shield: 'TISS63', optimum: '', drainSafe: '', senderSafe: '', notes: '70mm neck, Top of lug needs to be trimmed 2mm'),
        '2022': TruckData(shield: 'TISS63', optimum: '', drainSafe: '', senderSafe: '', notes: '70mm neck, Top of lug needs to be trimmed 2mm'),
      },
      'FE 6-150 TF': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FE 7-136': {
        '2021': TruckData(shield: 'TISS83', optimum: '', drainSafe: '12mm', senderSafe: 'NONE', notes: '35mm neck, 2 lugs, 100L, Cap has two layers of lugs, Add POW cap'),
      },
      'FE 7-150': {
        '2021': TruckData(shield: 'TISS63', optimum: '', drainSafe: '', senderSafe: '2 Seals & 4 x AB', notes: '70mm neck, 2 lugs, 100L, NEW SENDER IN DEVELOP, Tank Cover needs 2 x Seals and 4 x L Brackets'),
      },
      'FE 8-150': {
        '2021': TruckData(shield: 'TISS63', optimum: '', drainSafe: '', senderSafe: '2 Seals & 4 x AB', notes: '70mm neck, 2 lugs, 100L, NEW SENDER IN DEVELOP, Tank Cover needs 2 x Seals and 4 x L Brackets'),
      },
      'FJ 16-230L': {
        '2021': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FJ 16-230S': {
        '2021': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FJ 18-280S': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FJ 18-230L': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FJ 18-280R': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FJ 26-280 Mixer': {
        '2021': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ200L', notes: '200L, Cylinder Shape Tank'),
      },
      'FJ 26-280C Hypoid': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ200L', notes: '200L, Cylinder Shape Tank'),
      },
      'FJ 26-280C Hub': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ200L', notes: '200L, Cylinder Shape Tank'),
      },
      'FJ 26-280R': {
        '2021': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank, 730mm L - 890mm R'),
      },
      'FJ 26-420': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Cylinder Shape Tank'),
      },
      'FI 12-170': {
        '2022': TruckData(shield: 'Has OEM', optimum: '', drainSafe: 'M14', senderSafe: 'FJ290L', notes: '290L, Rectangular, 410 x 150'),
      },
      'FK 10-240': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FK 13-240': {
        '2022': TruckData(shield: 'TISS016', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs, 200L'),
      },
      'FK 16-270': {
        '2020': TruckData(shield: 'TISS063 M2', optimum: 'Supply cap', drainSafe: '', senderSafe: '', notes: '70mm neck, 2 lugs, 675mm, Cut off one lug - trim other lug to fit'),
        '2021': TruckData(shield: 'TISS063 M2', optimum: 'Supply cap', drainSafe: '', senderSafe: '', notes: '70mm neck, 2 lugs, 675mm, Cut off one lug - trim other lug to fit'),
        '2022': TruckData(shield: 'TISS063 M2', optimum: 'Supply cap', drainSafe: '', senderSafe: '', notes: '70mm neck, 2 lugs, 675mm, Cut off one lug - trim other lug to fit'),
      },
      'FM 16-253': {
        '2020': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs, 370mm'),
        '2021': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs, 370mm'),
        '2022': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs, 370mm'),
      },
      'FM 16-270 MT': {
        '2020': TruckData(shield: 'TISS032Fuso', optimum: 'Supply cap', drainSafe: '', senderSafe: '', notes: '70mm neck, 2 lugs, Cut off one lug - trim other lug to fit'),
      },
      'FN 25-270': {
        '2020': TruckData(shield: 'TISS032F', optimum: 'Supply cap 60mm/2Lug', drainSafe: '', senderSafe: '', notes: '60mm neck, 3 lugs, Tank Neck is bolted on, Remove 1 Lug to fit'),
        '2021': TruckData(shield: 'TISS032F', optimum: 'Supply cap 60mm/2Lug', drainSafe: '', senderSafe: '', notes: '60mm neck, 3 lugs, Tank Neck is bolted on, Remove 1 Lug to fit'),
        '2022': TruckData(shield: 'TISS032F', optimum: 'Supply cap 60mm/2Lug', drainSafe: '', senderSafe: '', notes: '60mm neck, 3 lugs, Tank Neck is bolted on, Remove 1 Lug to fit'),
      },
      'FV 26-310': {
        '2020': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
      },
      'FV26-420': {
        '2020': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
        '2022': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'TV 33-400': {
        '2020': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS16', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
      },
    },
    'HINO': {
      '200 - 310': {
        '2023': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'No Drainplug', senderSafe: '', notes: '35mm neck, 2 lugs, OEM Cap compatible - 12mm for strap nuts'),
      },
      '300 - 310': {
        '2023': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'No Drainplug', senderSafe: '', notes: '35mm neck, 2 lugs, 12mm for strap nuts'),
      },
      '300 - 614': {
        '2023': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 365mm between straps'),
      },
      '300 - 714': {
        '2023': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 560mm between straps'),
      },
      '300 - 816': {
        '2023': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 560mm between straps'),
      },
      '300 - 915': {
        '2020': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs'),
      },
      '300 - 916': {
        '2021': TruckData(shield: 'TISS016', optimum: '', drainSafe: 'M14', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs, 12mm for strap nuts - 2022 Cap is compatible'),
      },
      '500 - 1010': {
        '2020': TruckData(shield: 'TISS016', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS016', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS016', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
      },
      '500 - 1626': {
        '2021': TruckData(shield: 'TISS016', optimum: '', drainSafe: '1 x M30 + 2 x Sides M16', senderSafe: 'Small/Med Adjustable', notes: '80mm neck, 3 lugs, 390L Tank, 550mm between straps'),
      },
      '500 - 1627': {
        '2021': TruckData(shield: 'TISS016', optimum: '', drainSafe: '1 x M30(with indent) FILTER + 2 x Sides M16', senderSafe: 'SS- Hino 500 1627', notes: '80mm neck, 3 lugs, 390L Tank - OEM Cap Compatible, 580mm instrap/300mm wide/50mm high'),
      },
      '500 - 2836': {
        '2020': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '1 x M30 + 2 x Sides M16', senderSafe: '', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '', senderSafe: '', notes: '80mm neck, 3 lugs'),
      },
      '700': {
        '2024': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: '', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs, 2 tanks, Check if space to fit Optimum - OEM Cap Compatible'),
      },
    },
    'HOWO': {
      'Generic': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
    },
    'Hyundai': {
      'H100': {
        '2020': TruckData(shield: 'MH100/TISS084', optimum: '', drainSafe: '', senderSafe: '', notes: 'Needs CAP and longer grub screws'),
      },
      'Mighty': {
        '2021': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
      },
      'HD72': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
    },
    'International': {
      '7600': {
        '2011': TruckData(shield: '53mm Screw', optimum: '', drainSafe: '', senderSafe: '', notes: 'Screw type Cap, 490mm'),
      },
      '9800i': {
        '2013': TruckData(shield: 'TISS054', optimum: 'TISS550', drainSafe: '', senderSafe: '', notes: '90mm neck'),
      },
    },
    'Isuzu': {
      'FRR 550 (16T) 4x2': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: '', notes: '70mm neck, 2 lugs, 200L'),
      },
      'FRR 600 AMT (11T) 4x2': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M30x1.5', senderSafe: '', notes: '70mm neck, 2 lugs, 200L, 2 x Clamp Box 60x100x40'),
      },
      'FSR 750': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M14', senderSafe: 'SS-LARGE Adjust', notes: '70mm neck, 2 lugs, 300L, 450 - 765, 165/55, 635mm'),
      },
      'FSR 800': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FTM 1200': {
        '2020': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: 'CLAMPLOCKS AND SCREWS', notes: '70mm neck, 2 lugs, 2 tanks, 515mm, Interconnecting hose needs protection'),
        '2021': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: 'CLAMPLOCKS AND SCREWS', notes: '70mm neck, 2 lugs, 2 tanks, 515mm, Interconnecting hose needs protection'),
        '2022': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: 'CLAMPLOCKS AND SCREWS', notes: '70mm neck, 2 lugs, 2 tanks, 515mm, Interconnecting hose needs protection'),
      },
      'FTR 850': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: '2 x M16 + 2 x M30', senderSafe: 'CLAMPLOCKS AND SCREWS', notes: '70mm neck, 2 lugs, 2 tanks, 200L, 515mm, Interconnecting hose needs protection'),
      },
      'FTS 750 4x4 (12T)': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M14', senderSafe: 'SS-MED Adjust', notes: '70mm neck, 2 lugs, 300L, 380 - 610, 139/60, 400mm'),
      },
      'FVM 1200 (24T) 6x2': {
        '2023': TruckData(shield: 'TISS006', optimum: '', drainSafe: 'M14', senderSafe: 'SS ADJUST LARGE', notes: '80mm neck, 2 lugs, 2 tanks, 400L, 460mm, Clampsafe for filter and pipes'),
      },
      'FVR 900': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FVZ 1400': {
        '2023': TruckData(shield: 'TISS006', optimum: '', drainSafe: '', senderSafe: 'SSADJUSTABLE LARGE', notes: '80mm neck, 2 lugs, 2 tanks, 400L, 445mm'),
      },
      'FVZ 1600': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FXR 17-360': {
        '2023': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
      },
      'FXZ 26-350': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FXZ 26-360': {
        '2023': TruckData(shield: 'TISS066', optimum: '', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs, 400L'),
      },
      'FXZ 28-360': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FYH 33-350': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'FYH 33-360': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GR 16-210': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GR 16-240': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GSR 18-240 T/T': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GTR 24-240 T/T': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: 'CLAMPLOCKS AND SCREWS', notes: '70mm neck, 2 lugs, 2 tanks, 515mm, Interconnecting hose needs protection'),
      },
      'GVR 32-300 T/T': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GXR 35-350 T/T': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GXR 35-360 T/T': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GXR 40-360 T/T': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'GXZ 45-360 T/T': {
        '2023': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: '', senderSafe: 'SS MED ADJ 380-610', notes: '90mm neck, 3 lugs, 400L, 420mm'),
      },
      'NLR 150': {
        '2023': TruckData(shield: 'TISS083', optimum: '', drainSafe: '', senderSafe: '', notes: '2 lugs'),
      },
      'NMR 250': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M12', senderSafe: 'SS-MED Adjust', notes: '70mm neck, 2 lugs, 100L, 380 - 610, 139/60, 510mm'),
      },
      'NPR 275': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M12', senderSafe: 'ss-SML Adjust', notes: '70mm neck, 2 lugs, 100L, 255 - 395, 139/55, 350mm'),
      },
      'NPR 300 (6T) 4x2': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M12', senderSafe: 'ss-SML Adjust', notes: '70mm neck, 2 lugs, 100L, 255 - 395, 139/55, 350mm'),
      },
      'NPR 400 (7.5T) 4x2': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M14 x 1.5', senderSafe: 'SS-SML Adjust', notes: '70mm neck, 2 lugs, 100L, 255 - 395, 139/55, 350mm'),
      },
      'NPS 300 4x4': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
      },
      'NQR 500 AMT (8.5T) 4 x2': {
        '2023': TruckData(shield: 'TISS063', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'SS-LARGE Adjust', notes: '70mm neck, 2 lugs, 200L, 450 - 765, 165/55, 675mm'),
      },
    },
    'Iveco': {
      'Stralis': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks, 2nd tank has a Anti Siphon plate'),
      },
      'Trakker': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'Daily': {
        '2021': TruckData(shield: 'TISS036', optimum: '', drainSafe: '', senderSafe: '', notes: '40mm neck, 2 lugs with clip'),
      },
      'Eurocargo': {
        '2021': TruckData(shield: 'TISS006/TISS007', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, Check if space to fit Optimum'),
      },
      'S-Way': {
        '2022': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2nd Tank is aftermarket and has a welded in plate'),
      },
    },
    'MAN': {
      'CLA': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '600mm 70mm HEIGHT', notes: '80mm neck, 2 lugs, Single round tank, 600mm'),
      },
      'M2000': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: 'M18', senderSafe: '', notes: contactInfo),
      },
      'TGX': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'TGS': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'TGX 26.540': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs, 735mm'),
      },
      '13 TON RIGID': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 1 tank, 600L, 790mm'),
      },
      'ADBLUE': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs, 300L, 700mm'),
      },
      'TGM 25.280': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'TGS 27.440': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'TGS 33 440': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs, 770mm'),
      },
      'TGS 33 480': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: '', notes: '80mm neck, 2 lugs, 600mm, 250L'),
      },
      'TGS 26 440': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M18', senderSafe: 'MAN....590L 935mm inst', notes: '80mm neck, 2 lugs, 520/935mm, 460L/580L'),
      },
    },
    'Mercedes Benz': {
      'Actros 1836': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: 'RSA4771101', notes: '80mm neck, 2 lugs, 390L, 300mm'),
      },
      'Actros 1840': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: 'RSA4771101', notes: '80mm neck, 2 lugs, 390L, 300mm'),
      },
      'Actros 1842': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: 'SSMB 480L/ SSMB 400L', notes: '80mm neck, 2 lugs, 2 tanks, 315mm/260mm'),
      },
      'Actros 26.46': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: 'SS LRGADJUSTABLE/ SSMB 400L', notes: '80mm neck, 2 lugs, 2 tanks, 550mm/260mm'),
      },
      'Actros 2645': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: 'SSMB 480L/ SSMB 400L', notes: '80mm neck, 2 lugs, 2 tanks, 315mm/260mm'),
      },
      'Actros 2652': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: 'SSMB 480L/ SSMB 400L', notes: '80mm neck, 2 lugs, 2 tanks, 315mm/260mm'),
      },
      'Actros 2845': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks'),
      },
      'Actros 3345': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14 Banjo', senderSafe: 'SSMB 480L/ ?', notes: '80mm neck, 2 lugs, 315mm/315mm'),
      },
      'Arocs 1836': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 400mm x 150mm, DRAWINGS DONE'),
      },
      'Arocs 3236': {
        '2023': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: '290L, ' + contactInfo),
      },
      'Arocs 3336': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 400mm x 150mm, DRAWINGS DONE'),
      },
      'Arocs 3352': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 260mm x 150mm, DRAWINGS DONE'),
      },
      'Arocs 3358': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 210mm x 190mm, DRAWINGS DONE'),
      },
      'Arocs 4152': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs, 400mm x 150mm, DRAWINGS DONE'),
      },
      'Atego': {
        '2020': TruckData(shield: 'TISS017', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
        '2021': TruckData(shield: 'TISS017', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
        '2022': TruckData(shield: 'TISS017', optimum: '', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'Axor': {
        '2023': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M14', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'Sprinter': {
        '2023': TruckData(shield: 'TISS047', optimum: '', drainSafe: '', senderSafe: '', notes: '40mm neck, 2 lugs'),
      },
    },
    'MITSUBISHI': {
      '4TON': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '3 Dplugs 2X24mm 1X30', senderSafe: '', notes: '60mm neck, 3 lugs, 670mm, Cut off one lug - trim other lug to fit'),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '3 Dplugs 2X24mm 1X30', senderSafe: '', notes: '60mm neck, 3 lugs, 670mm, Cut off one lug - trim other lug to fit'),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '3 Dplugs 2X24mm 1X30', senderSafe: '', notes: '60mm neck, 3 lugs, 670mm, Cut off one lug - trim other lug to fit'),
      },
    },
    'Powerstar': {
      'FT 3': {
        '2021': TruckData(shield: 'TISS083POW', optimum: '', drainSafe: '', senderSafe: '', notes: '45mm neck, Needs 5 x 10mm Grubscrews + CAP'),
      },
      'FT 5': {
        '2021': TruckData(shield: 'TISS083POW', optimum: '', drainSafe: '27 HEX M16', senderSafe: 'SS MED ADJ 380-610', notes: '45mm neck, SCREW TYPE, 490mm, Needs 5 x 10mm Grubscrews + CAP'),
      },
      'FT 8 M4': {
        '2021': TruckData(shield: 'TISS009POW', optimum: '', drainSafe: '24 HEX M14', senderSafe: 'SS MED ADJ 380-610', notes: '70/90mm neck, SCREW TYPE, 580mm, Change to 20mm Grub Screws'),
      },
      'FT 9': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '27 HEX M16', senderSafe: 'SS LARGE ADJUSTABLE', notes: '90mm neck, 3 lugs, 690mm, Change to 20mm Grub Screws'),
      },
      'SKD 88': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '24 HEX M14', senderSafe: 'SS MED ADJ 380-610', notes: '90mm neck, 3 lugs, 420mm/690mm, Change to 20mm Grub Screws'),
      },
      '1627': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: 'New tank comes with welded oem device, 80mm/2 lug lockable cap'),
      },
      'SKD 61-8': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '24 HEX M14', senderSafe: 'SS MED ADJ 380-610', notes: '90mm neck, 3 lugs, 420mm, Change to 20mm Grub Screws'),
      },
      'SKD97 1729': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '20 HEX M14', senderSafe: '', notes: '90mm neck, 3 lugs, 850mm, Change to 20mm Grub Screws'),
      },
      'FT 10 MAX': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '24 HEX M16', senderSafe: 'SS MED ADJ 380-610', notes: '90mm neck, 3 lugs, 580mm, Change to 20mm Grub Screws'),
      },
      'V3': {
        '2021': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: '', senderSafe: 'SS POW V3', notes: '90mm neck, 3 lugs, 430mm AND 400mm, 3 STRAPS'),
      },
      'FT 10': {
        '2021': TruckData(shield: 'TISS066', optimum: '', drainSafe: '24 HEX M16', senderSafe: 'SS MED ADJ 380-610', notes: '90mm neck, 3 lugs, 690mm, Change to 20mm Grub Screws'),
      },
      'VX': {
        '2021': TruckData(shield: 'TISS066', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
      },
    },
    'Scania': {
      'G460': {
        '2020': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
        '2021': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
        '2022': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
      },
      'R460': {
        '2020': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
        '2021': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
        '2022': TruckData(shield: 'TISS009', optimum: 'TISS510', drainSafe: 'M22', senderSafe: '', notes: '2 tanks, Left 440mm / Right 490mm'),
      },
    },
    'SITRACK': {
      'C9H 480': {
        '2024': TruckData(shield: '', optimum: 'TISS560', drainSafe: 'M14', senderSafe: '', notes: '455mm, Sino Short (ss sino 250L)/ sino LONG RANGE(ss sino 800L)'),
      },
      'G7 480': {
        '2023': TruckData(shield: '', optimum: 'TISS560', drainSafe: 'M14', senderSafe: '', notes: '750mm, Sino Short (ss sino 250L)/ sino 750mm(ss sino 600L)'),
      },
    },
    'TATA': {
      '1518C': {
        '2020': TruckData(shield: 'TISS085', optimum: '', drainSafe: '', senderSafe: '', notes: 'Standard'),
        '2021': TruckData(shield: 'TISS085', optimum: '', drainSafe: '', senderSafe: '', notes: 'Standard'),
        '2022': TruckData(shield: 'TISS085', optimum: '', drainSafe: '', senderSafe: '', notes: 'Standard'),
      },
      'Generic': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: 'Snapfit unit, ' + contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: 'Snapfit unit, ' + contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: 'Snapfit unit, ' + contactInfo),
      },
    },
    'TOYOTA': {
      'DYNA': {
        '2020': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 365mm between straps NO CAP NEEDED'),
        '2021': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 365mm between straps NO CAP NEEDED'),
        '2022': TruckData(shield: 'TISS084', optimum: '', drainSafe: 'M12 - 1.25', senderSafe: 'Med Adjustable', notes: '35mm neck, 2 lugs, 12mm for strap nuts - 365mm between straps NO CAP NEEDED'),
      },
    },
    'UD': {
      'Kuzer RKE150 (H37-Rigid)': {
        '2023': TruckData(shield: 'TISS083', optimum: '', drainSafe: 'M16', senderSafe: 'SS KUZER', notes: '180L, 840mm, hoses to the side TO QUOTE FOR CAP - 35mm FAW'),
      },
      '440': {
        '2020': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
      },
      '460': {
        '2020': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
      },
      'Croner PDE250': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
      },
      'Croner PKE250': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-UD315L', notes: '315L, 80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
      },
      'Generic 190L': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 190L, Long Rectangular Tank'),
      },
      'Quester CWE 330': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: '315L, ' + contactInfo),
      },
      'Quester CWE 370': {
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: 'M22x1.5', senderSafe: 'SS-Adj Sml 139mm', notes: '340mm'),
      },
      'Quester CWE 33 Dump Truck (E04)': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: '300L, ' + contactInfo),
      },
      'Quester Escot-GWE 330': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, Round Tank/Merc Type Cap'),
      },
      'Quester Escot-GWE 370': {
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: '315L, ' + contactInfo),
      },
      'Quester Escot-GWE 420': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'Quester Escot-GWE 440': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks, Round Tank/Merc Type Cap'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks, Round Tank/Merc Type Cap'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks, Round Tank/Merc Type Cap'),
      },
      'GW 26-490': {
        '2020': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '50_500_50x200', notes: '90mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '50_500_50x200', notes: '90mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '50_500_50x200', notes: '90mm neck, 3 lugs'),
      },
      'GW 26-450': {
        '2020': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '90mm neck, 3 lugs'),
      },
      'A975 UD 40 (Cabstar)': {
        '2020': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: 'Internal Thread Neck'),
        '2021': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: 'Internal Thread Neck'),
        '2022': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: 'Internal Thread Neck'),
      },
      'UD 80': {
        '2020': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
      },
      'UD 90': {
        '2020': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
      },
      'UD 95': {
        '2020': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2021': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
        '2022': TruckData(shield: 'TISS016', optimum: 'TISS520', drainSafe: 'M30x1,5', senderSafe: 'Med Adjustable', notes: '80mm neck, 3 lugs'),
      },
      'UD290': {
        '2020': TruckData(shield: 'TISS16', optimum: '', drainSafe: 'M30x1,6', senderSafe: 'Med Adjustable', notes: ''),
        '2021': TruckData(shield: 'TISS16', optimum: '', drainSafe: 'M30x1,6', senderSafe: 'Med Adjustable', notes: ''),
        '2022': TruckData(shield: 'TISS16', optimum: '', drainSafe: 'M30x1,6', senderSafe: 'Med Adjustable', notes: ''),
      },
      'UD330': {
        '2020': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2021': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
        '2022': TruckData(shield: '', optimum: '', drainSafe: '', senderSafe: '', notes: contactInfo),
      },
      'Quon GW26 410-TT (E08)': {
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 400L+400L'),
      },
      'Quon GW26-460': {
        '2020': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks'),
        '2021': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks'),
        '2022': TruckData(shield: 'TISS006', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs, 2 tanks'),
      },
      'Quon 490 (E07) Volvo Tank': {
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
      'UD40 (Cabstar)': {
        '2020': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
        '2021': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
        '2022': TruckData(shield: 'MH100', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
      },
      'Quon': {
        '2020': TruckData(shield: 'TISS66', optimum: 'TISS560', drainSafe: '', senderSafe: '', notes: '80mm neck, 2 lugs'),
      },
    },
    'Volvo': {
      'FH 440': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Left 270mm / Right 470mm', notes: '80mm neck, 2 lugs'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Left 270mm / Right 470mm', notes: '80mm neck, 2 lugs'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Left 270mm / Right 470mm', notes: '80mm neck, 2 lugs'),
      },
      'FMX 440': {
        '2020': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Med Adjustable', notes: '80mm neck, 2 lugs'),
        '2021': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Med Adjustable', notes: '80mm neck, 2 lugs'),
        '2022': TruckData(shield: 'TISS06', optimum: 'TISS500', drainSafe: 'M22', senderSafe: 'Med Adjustable', notes: '80mm neck, 2 lugs'),
      },
    },
    'VW Constellation': {
      'Constellation': {
        '2020': TruckData(shield: 'TISS09', optimum: 'TISS510', drainSafe: '', senderSafe: '', notes: '65mm neck, screw type'),
        '2021': TruckData(shield: 'TISS09', optimum: 'TISS510', drainSafe: '', senderSafe: '', notes: '65mm neck, screw type'),
        '2022': TruckData(shield: 'TISS09', optimum: 'TISS510', drainSafe: '', senderSafe: '', notes: '65mm neck, screw type'),
      },
    },
    'VW Crafter': {
      'Crafter': {
        '2021': TruckData(shield: 'TISS47', optimum: '', drainSafe: '', senderSafe: '', notes: ''),
      },
    },
  };
}