# Clean
rm ./fonts/ttf/*.ttf
rm ./fonts/otf/*.otf

echo "Build TTF fonts"
mkdir -p ./fonts ./fonts/ttf
fontmake -g sources/Kanit_Upright_Master.glyphs -i -o ttf --output-dir ./fonts/ttf/ -a
fontmake -g sources/Kanit_Italic_Master.glyphs -i -o ttf --output-dir ./fonts/ttf/ -a

echo 'Processing TTF'
ttfs=$(ls ./fonts/ttf/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig --autofix $ttf
	gftools fix-hinting $ttf
	[ -f $ttf.fix ] && mv $ttf.fix $ttf
done

echo "Build OTF fonts"
mkdir -p ./fonts ./fonts/otf
fontmake -g sources/Kanit_Upright_Master.glyphs -i -o otf --output-dir ./fonts/otf/
fontmake -g sources/Kanit_Italic_Master.glyphs -i -o otf --output-dir ./fonts/otf/

echo 'Processing OTF'
otfs=$(ls ./fonts/otf/*.otf)
for otf in $otfs
do
	gftools fix-dsig --autofix $otf
done

# Clean up
rm -rf ./instance_ufo
rm -rf ./master_ufo

echo "Complete!"
