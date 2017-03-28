var currentposition = 1;			// where the player is on the game board
var lastposition = 8;				// the last square on the board
var nWrongGuesses = 0;
var playerIcon = "img/icon1.gif"; // by default, the icon used to represent the player
var message = '';						// used to post a global message that other frames can read and print out

// Initialize the array for keeping track of the questions we have already asked
var questionsUsed = new Array;
for (var i=currentposition; i<lastposition; i++) {
	questionsUsed[i]=0;
}

//
// The Questions
//
var q = new Array; // the array of questions
	q[1] = new ChoiceQuestion ("Which issue did scientists mention most often as being an important environmental issue?",3,"Freshwater scarcity","Deforestation","Climate change","Loss of biodiversity","../future/science.htm","The SCOPE survey involved 200 environmental experts in more than 50 countries.","");
	q[2] = new ChoiceQuestion ("What is sustainable development?",1,"Meeting the needs of today's generation without compromising the ability of future generations to meet their needs.","Creating solid construction foundations so that buildings can resist earthquake damage.","Encouraging people to use cars instead of bicycles because they are faster.","A Canadian rock band.","../future/index.htm","This definition comes from the report of the World Commission on Environment and Development, <i>Our Common Future</i>.","");
	q[3] = new ChoiceQuestion ("What was the voluntary agreement reached at the Rio Earth Summit called?", 3, "The sustainable development declaration", "The Montreal Protocol", "Agenda 21", "The 'Earth-one' declaration", "../future/index.htm", "<b>Agenda 21</b> has become the guiding document for government management of the environment in most regions of the world, but young people have identified many gaps!","");
	q[4] = new ChoiceQuestion ("How many people are added to the planet each year?", 3, "27 million", "55 million", "78 million", "103 million", "../welcome2.htm", "The world's population has more than doubled in the last fifty years and is still growing, although the rate of growth is beginning to slow down.","");
	q[5] = new ChoiceQuestion ("What is the main fear concerning freshwater according to GEO?", 1, "Uneven distribution", "Pollution", "Depleting resources", "Human health", "../fresh/index.htm", "More than a fifth of the world's population doesn't have enough water: it is likely people will go to war over water in your lifetime.","");
	q[6] = new ChoiceQuestion ("How many children die every year from polluted water?",3,"2 million","9 million","15 million","22 million","../fresh/index.htm","Lack of clean water, in combination with poor sanitation and hygiene, causes diseases which kill millions every year.","");
	q[7] = new ChoiceQuestion ("What happens if coral reefs die?",1,"Seas and fish will die","Fish will have more space to swim","Beaches will become larger","Nothing will change","../marine/index.htm","Coral reefs are like the rainforests of the sea, but 60% of them are dying, mainly as a result of pollution from human activity.","");
	q[8] = new ChoiceQuestion ("What percentage of all sea pollution is from land-based activities?",4,"28%","41%","63%","75%","../marine/index.htm","Pollution comes from cities, farms, and industries along coasts and rivers.","");
	q[9] = new ChoiceQuestion ("Why are mangrove swamps important?",1,"They are a major breeding ground for fish and crustaceans","They are good spots for surfing and swimming","They smell good","They look nice","../marine/index.htm","Cutting down mangroves has also reduced protection from cyclones and storm surges, increased seawater intrusion, and acidified surface waters.","");
	q[10] = new ChoiceQuestion ("What feeds on krill and plankton?",2,"Sharks","Whales","Jellyfish","Sea turtles","../polar/index.htm","Krill are small shrimplike animals that live in the open sea in giant swarms.  Plankton is a broad group of organisms that drift because they are too small or weak to swim.  Plankton includes plant-like algae as well as animal-like crustaceans which are the marine counterparts of insects on land.","");
	q[11] = new ChoiceQuestion ("How many blue whales are left in the world now?",2,"100","500","2000","5000","../polar/index.htm","Blue whales are the largest of all known animals.  They were once heavily hunted, and although they are now protected, they are still classified as critically endangered.","");
	q[12] = new ChoiceQuestion ("Give an example of a North American exotic species.",4,"Elephant","Bald eagle","Penguin","Zebra mussels","../bio/index.htm","The accidental or deliberate introduction of a new species in an area sometimes means disaster for the species already living there.","");
	q[13] = new ChoiceQuestion ("Why is Dolly so famous?",1,"Dolly the sheep is the worlds first cloned animal","She won many international environmental prizes","She lived in a tree in order to save rainforests","She lives in a 100% recycled home","../bio/index.htm","Cloning may increase people's ability to genetically modify plants and animals beyond what we have already been able to do by selective breeding.","");
	q[14] = new ChoiceQuestion ("How many different species have scientists recorded?",2,"532 thousand","1.75 million","22.5 million","52.8 million","../bio/index.htm","That's a lot, but those are only the ones which have been recorded many more species have not even been counted.  In fact there are probably seven times as many species in total, or maybe more!","");
	q[15] = new ChoiceQuestion ("What wiped out Dodos on Mauritius?",1,"European settlers","The smarties","The bird dogs","Asian merchants","../bio/bio2.htm","Eighty years after the arrival of Europeans on the island, the last dodo was dead.","");
	q[16] = new ChoiceQuestion ("What percentage of the world's population now lives in cities?",2,"10%","50%","62%","39%","../urban/index.htm","The proportion of city-dwellers is continuing to increase around the world.","");
	q[17] = new ChoiceQuestion ("What is the most valuable resource for cities?",4,"Trees","Large free-moving animals","Movie theatres","Water","../urban/index.htm","Bringing drinking water to cities has always been a challenge, all the way back to ancient times.  The aqueducts of ancient Rome are among the greatest engineering achievements in history.","");
	q[18] = new ChoiceQuestion ("How many people are estimated to be homeless in both developed and developing countries?",4,"5 million","20 million","50 million","100 million","../urban/index.htm","It is estimated that 100 million people in cities are homeless in both developed and developing countries.","");
	q[19] = new ChoiceQuestion ("How many cities have more than 20 million people?",3,"1","2","3","4","../urban/index.htm","The three most populous cities in the world are Tokyo (Japan), Mexico City (Mexico), and S&atilde;o Paulo (Brazil).","");
	q[20] = new ChoiceQuestion ("How many people on average live on one square kilometer in Asia?",4,"68","112","146","182","../land/index.htm","The combination of poverty and population pressure is forcing people to move to ecologically-fragile areas in Asia.","");
	q[21] = new ChoiceQuestion ("What are POPs?",1,"Persistent Organic Pollutants","Particularly Offensive People","Polluting Office Products","An environmentally friendly soda drink","../land/land3.htm","POPs are blown by the wind around the globe, build up in the food chain, and accumulate in animals and humans.","");
	q[22] = new ChoiceQuestion ("Why does Kruti Parekh promote worms?",2,"They make good pets","She uses them to break down garbage into fertiliser","They are more intelligent than jellyfish","They absorb CO<sub>2</sub> from the atmosphere","../response/eco.htm","Worms are great for composting food waste in homes and offices!","");
	q[23] = new ChoiceQuestion ("What is Planet Xpress?",4,"An environmentally friendly high speed train","A disaster movie","An environmental newspaper","A web site for young people to exchange ideas on global issues","../response/eco2.htm","There are many ways for young people to make a difference!","");
	q[24] = new ChoiceQuestion ("What is an MEA?",1,"Multilateral Environmental Agreement","Meaningful Environmental Assemblies","Multiple Environmental Assessments","Multidimensional Endorphin Alternatives","../future/index.htm","The success of these agreements requires not only governments, but also international organizations, trade associations, NGOs and the general public to get involved.","");
	q[25] = new ChoiceQuestion ("What is the Montreal Protocol?",1,"An MEA agreed by governments in 1987 to halve Chlorofluorocarbon (CFC) emissions by 1998 and phase them out completely by 2006","A biodiversity convention agreed by governments in 1988 to increase biodiversity in North America","A climate change convention agreed by governments in 1989 to eliminate CO<sub>2</sub> in the atmosphere by 2020","A desertification convention agreed by governments in 1986 to increase deserts by 6.7% every year for the next 50 years.","../future/index.htm","","");

var nQuestions = 25; 		// the number of questions that there are

// The question object definition
function ChoiceQuestion(t, ans, a, b, c, d, h, extra, soundfile) {
	this.text = t;
	this.correctanswer = ans;
	this.choice = new Array();
	this.choice[1] = a;
	this.choice[2] = b;
	this.choice[3] = c;
	this.choice[4] = d;
	this.hint = h;
	this.extra = extra;
	this.sound = soundfile;

	// Count the number of choices that we have
	this.nChoices = 0;
	for (var i=1; i<=4; i++) {
		if (this.choice[i]) {
			this.nChoices++;
		}
	}
}


//
// Functions about asking questions
//

function alreadyAsked(n) {
	for (var i=1; i < top.lastposition; i++) {
		if (n == top.questionsUsed[i]) {
			return 1;
		}
	}
	return 0;
}

function nextQuestion() {
	var question = rand(top.nQuestions);
	while (alreadyAsked(question)) {
		question = rand(top.nQuestions);
	}
	top.questionsUsed[currentposition] = question;
	return q[question];

	//return q[rand(top.nQuestions)];
}

function tryagain() {
	nWrongGuesses++;
	//top.title.location='tryagain.htm?'+nWrongGuesses;
	top.title.location='tryagain.htm';
}

//
// Functions about moving game pieces on the board
//

function startposition(icon) {
	playerIcon = icon;
	top.board.document.s1.src = playerIcon;
}
function moveIcon(from,to) {
	eval ('top.board.document.s' + from + '.src = "img/blank.gif"');
	eval ('top.board.document.s' + to + '.src = "'+playerIcon+'"');
}

function advance(msg) {
	// if the board frame isn't showing the game board, then show it
	currentposition++;
	if (top.board.location.pathname.indexOf('board.htm') == -1) {
		top.board.location='board.htm';
		setTimeout("moveIcon(currentposition-1, currentposition)",2000);
	} else {
		moveIcon (currentposition-1, currentposition);
	}
	if (currentposition == lastposition) {
		endGame();
	} else {
		if (msg) { 
			top.message = msg; 
		} 	else {
			top.message = ''; 
		}
		top.question.location = 'correct.htm';
	}

}
function endGame() {
	top.question.location="blank.htm";
	top.board.location="endgam1.htm?"+nWrongGuesses;
}


//
// The random number generator
// The Central Randomizer 1.3 (C) 1997 by Paul Houle (houle@msc.cornell.edu)
// See:  http://www.msc.cornell.edu/~houle/javascript/randomizer.html
//

rnd.today=new Date();
rnd.seed=rnd.today.getTime();
function rnd() {
        rnd.seed = (rnd.seed*9301+49297) % 233280;
        return rnd.seed/(233280.0);
};
function rand(number) {
        return Math.ceil(rnd()*number);
};

