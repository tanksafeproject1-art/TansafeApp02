class FitmentGuide {
  final String title;
  final String description;
  final List<String> steps;
  final String toolsRequired;
  final String fitmentTime;

  FitmentGuide({
    required this.title,
    required this.description,
    required this.steps,
    required this.toolsRequired,
    required this.fitmentTime,
  });
}

class FitmentGuidesData {
  static final Map<String, FitmentGuide> guides = {
    'DrainSafe Fitment Guide': FitmentGuide(
      title: 'DrainSafe Fitment Guide',
      description: 'Complete guide for installing DrainSafe anti-siphon drain plugs',
      fitmentTime: '15 Minutes',
      toolsRequired: 'DrainSafe Tool, ratchet, socket set',
      steps: [
        'Step 1: Do your preparation. Do not attempt fitment with a full tank. Have all the tools and drain plugs required nearby. Attach the DrainSafe nut to the magnetic tool.',
        'Step 2: Place an empty container directly below the drainplug. Remove the OEM drain plug with the appropriate socket or hex key. Gently move the original drainplug back and forth before taking it off to lubricate the threads so DrainSafe will go in easier.',
        'Step 3: Have the DrainSafe nut and tool ready in your second hand and ready to swap when you remove the OEM drain plug. Thread the DrainSafe bolt in by hand. It should thread in by hand if aligned correctly. Don\'t overtighten as you will break the DrainSafe. When fitted dry the DrainSafe and check there is no dripping.',
        'Step 4: Empty the fuel container back into the tank. Make sure that your work area is clean before leaving.',
        'Helpful Tips: Tie a cloth around your main wrist to prevent diesel from running down your arm. Practice this work area quickly to ensure that spillage is kept to a minimum.'
      ],
    ),
    'SenderSafe Fitment Guide': FitmentGuide(
      title: 'SenderSafe Fitment Guide',
      description: 'Professional installation guide for SenderSafe fuel sender protection systems',
      fitmentTime: '30-45 Minutes',
      toolsRequired: 'Standard mechanical tools, socket set, measuring tape',
      steps: [
        'Step 1: Ensure vehicle is on level ground and fuel tank is less than 50% full for safety',
        'Step 2: Locate fuel sender unit and measure dimensions for correct SenderSafe model selection',
        'Step 3: Remove existing fuel sender following manufacturer guidelines',
        'Step 4: Install SenderSafe unit ensuring proper alignment with tank opening',
        'Step 5: Secure SenderSafe with provided straps and hardware according to specifications',
        'Step 6: Test fuel gauge functionality and check for proper operation',
        'Step 7: Complete installation verification and document fitment details'
      ],
    ),
    'TankSafe Fitment Guide': FitmentGuide(
      title: 'TankSafe Fitment Guide - Permanent Fitment',
      description: 'Complete installation guide for TankSafe anti-siphon devices with permanent adhesive bonding',
      fitmentTime: '10-15 Minutes',
      toolsRequired: 'Mini ratchet with 3mm allen key bit, oil filter wrench strap (large, long nose pliers, ratchet, punches)',
      steps: [
        'Check you have the required tools: mini ratchet with 3mm allen key bit, oil filter wrench strap, large, long nose pliers, ratchet, punches',
        'Check you have the following consumables: degreasing agent, cloth, and permanent Loctite (Rubber gloves do also help. Without gloves your fingers go black and will take three days to clean off)',
        'Ensure the tank is not more than 80% full (you want the fuel at least 100mm from the bottom of the tank neck to prevent diesel from contacting adhesive while curing)',
        'The vehicle must not move for 45 minutes after installation is completed for the adhesive to cure',
        'Remove the diesel cap and chain on the diesel tank neck',
        'Remove any OEM anti-spill flap, sleeve or existing security device',
        'Check the TankSafe fits on the neck in the same way as the cap fits (you may need to adjust grub screws to fit)',
        'Check the cap fits on the TankSafe device',
        'Clean the tank neck with a degreasing agent and a clean cloth or paper towel for the adhesive to bond',
        'Apply adhesive to the underside of the anti-siphon. A tube of the adhesive supplied is sufficient. Use disposable pliers for squeezing the small 50ml tube. The adhesive expands to form a gasket so it must make a continuous ring (see photo & video)',
        'Insert device into tank neck and tighten with oil filter strap wrench',
        'Insert a cloth or plastic packet into the anti-siphon to prevent ratchet bits falling into the tank',
        'When secure, proceed to tighten grub screws alternating between grub screws so that they extend equally. You should feel a ripple on the opposite side of the tank when the grub screw is tightened far enough',
        'The grub screws must be in far enough for the splash ring to be inserted',
        'Look for any glue that may run down the tank, wipe while wet',
        'Before inserting splash ring, apply Loctite to 50% of the thread (eg from 12H00 to 06H00)',
        'Then insert splash ring and tighten by hand it will make a minimum of six full turns',
        'When tight, use punch and hammer to tighten the splash ring (try only one small mark on the ring with the punch)',
        'Fit the cap to the TankSafe chain (if not an original cap it might be a bit tight)',
        'Leave vehicle to stand for 40 minutes so the adhesive can cure',
        'The above fitment should not take more than 10 - 15 minutes',
        'If doing a trial/transferable fitment don\'t use adhesive or Loctite but use gasket supplied'
      ],
    ),
    'TankSafe Shield TISS083 OR TISS084 Fitting Instructions': FitmentGuide(
      title: 'TISS TankSafe Anti-Siphon Fitting Instructions - FAW Mitsubishi Fuso / Hino 300 / Toyota Dyna / Isuzu',
      description: 'Specific fitting instructions for TISS083 and TISS084 models on small neck diameter trucks',
      fitmentTime: '15-20 Minutes',
      toolsRequired: 'Isopropyl cleaning agent and clean cloth, Emery paper, 2.5mm allen key or ¼ drive ratchet with allen bit, 60ml Tube of PU580 Adhesive, 3 x Grub Screws',
      steps: [
        'Please check your TankSafe Anti-siphon kit includes: 1 x TISS TankSafe Fuel Security Device, 1 x Threaded collar, 1 x 60ml Tube of PU580 Adhesive, 3 x Grub Screws',
        'PLEASE ENSURE THAT THE 3 GRUB SCREWS ARE TIGHTENED IN ADDITION TO THE ADHESIVE',
        'STEP 1: Ensure the tank has less than 2/3 full of diesel. Remove fuel cap and chain from the tank',
        'STEP 2: Use Isopropyl cleaning agent and a Cloth to wipe and clean the outside of the filler neck and the underside of the TankSafe neck',
        'STEP 3: Apply the adhesive on the underside of the TankSafe neck except at 50mm from the two lugs (as per Step 3 below)',
        'STEP 4: Place the TankSafe device on top of the filler neck and align the lugs on the underside of the TankSafe Device (as though you were fitting the cap). Firmly twist TankSafe',
        'STEP 5: After the TankSafe is fitted - Tighten the three grub screws equally using a 2.5mm allen key or ideally a ¼ drive ratchet and allen bit',
        'STEP 6: Apply threadlock to the three grub screws and then tighten service so the threaded collar can be threaded on',
        'Replace fuel cap. The vehicle can now be used straight away. However, we recommend that the tank is not filled with fuel until 1 hour after fitting to allow the TankSafe unit to be securely bonded'
      ],
    ),
    'TankSafe TISS047 Fitment Guide': FitmentGuide(
      title: 'Fitment Guide TankSafe TISS047',
      description: 'Installation guide for TISS047 model anti-siphon device for 40mm neck diameter applications',
      fitmentTime: '15 Minutes',
      toolsRequired: 'Mini ratchet, strap wrench, degreaser',
      steps: [
        'STEP 1 - FITTING INSTRUCTIONS: Remove fuel cap. Wipe and clean outside and inside of filler neck with solvent type de-greasing agent and also clean the underside of TankSafe neck. Then lightly abrade the fuel filler neck using emery paper and then wipe away any residue using the solvent type de-greaser. Ensure that the filler neck is clean and dry before fitting the TankSafe device.',
        'STEP 2: Using a Stanley knife or sharp blade, trim 3mm off the end of the rubber that secures the cap to the flap. Once done, push the tab back as far as it will go against the flap. This MOD will prevent the flap fowling on the filler cap.',
        'STEP 3: Apply a good bead of the adhesive to the underside of the TankSafe head and then insert into the filler neck. Align the two lugs on the underside and then twist firmly into place until the two openings on the TankSafe unit end up in the 3 o\'clock / 9 o\'clock position. This will ensure that when the cap is fitted it will not foul the panel flap when closed.',
        'STEP 4: Tighten the two grub screws equally using a 2.5mm allen key these will hold the system in place while the adhesive cures. Do not over tighten the grub screws.',
        'STEP 5: Wipe away any excess adhesive and then replace the fuel cap, please ensure that when the cap is fitted it is in the same position as the step 5 photo. The vehicle may now be used.',
        'SUPPORT: Please contact the TankSafe South Africa Technical Team DBN: Bradley Pillay 076 936 7616 | JHB: Trevor Smith 083 414 2276 | Office: 031 566 2919'
      ],
    ),
    'TankSafe TISS063 Fitment Guide': FitmentGuide(
      title: 'Fitment Guide TankSafe TISS063',
      description: 'Installation guide for TISS063 model anti-siphon device for 70mm neck diameter, 2-lug applications',
      fitmentTime: '15 Minutes',
      toolsRequired: 'Mini ratchet, strap wrench, punch',
      steps: [
        'STEP 1 - TISS063 with Rubber Gasket and Spash Ring',
        'STEP 2 - Clean the neck of the tank and TISS063 with degreaser',
        'STEP 3 - Apply the PU glue on the base of the unit and on the gasket',
        'STEP 4 - Insert the unit into the neck of the tank and turn clockwise. Tighten firmly with Strap Wrench',
        'STEP 5 - Apply loctite on grub screws then tighten with mini ratchet',
        'STEP 6 - Apply loctite on splash ring then tighten and secure with steel punch',
        'STEP 7 - Installation is complete',
        'STEP 8 - Fit tank cap',
        'SUPPORT: Please contact the TankSafe South Africa Technical Team DBN: Bradley Pillay 076 936 7616 | JHB: Trevor Smith 083 414 2276 | Office: 031 566 2919'
      ],
    ),
  };
}