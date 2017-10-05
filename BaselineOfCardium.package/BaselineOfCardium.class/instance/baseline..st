baselines
baseline:spec 
	
	<baseline>
	
	spec for: #common do:[spec package: 'Cardium-Model'; 
									   package: 'Cardium-Test' with: [spec requires: 'Cardium-Model'].
									
									
									spec group: 'Deployment' with: #('Cardium-Model').
									spec group: 'Development' with: #('Cardium-Test').
									spec group: 'default' with: #('Development').
									]
								